# Portage MacBook Air → MacBook Pro

Checklist pour reprendre la production vidéo sur le MacBook Pro du coéquipier.

## 1. Ramener le pipeline dans le repo

C'est le vrai blocage : le pipeline n'existe qu'en local sur le MacBook Air,
non versionné. Tant qu'il n'est pas dans git, il n'est ni reproductible sur le
MacBook Pro, ni visible par une session Claude Code remote.

**Sur le MacBook Air**, retrouver les scripts de génération :

```bash
# Où sont les scripts qui appellent ffmpeg ?
grep -rl 'ffmpeg' ~/Documents ~/Desktop ~/Projects 2>/dev/null | head -50

# Les commandes de rendu déjà lancées, dans l'historique du shell
grep -E 'ffmpeg|remotion|manim|render' ~/.zsh_history | tail -50
```

Puis copier dans `video-production/` :

- les scripts de génération / rendu ;
- le manifeste de dépendances (`package.json`, `requirements.txt`…) — **avec**
  son lockfile, c'est lui qui garantit des rendus identiques d'une machine à
  l'autre ;
- les fichiers de configuration (presets d'encodage, templates, paramètres) ;
- la liste des polices utilisées (voir §3).

**Ne pas commiter** : les médias sources et les rendus. Voir §4.

## 2. Installer sur le MacBook Pro

```bash
git clone <ce-repo> && cd <ce-repo>
./video-production/setup-macos.sh
```

Le script installe Homebrew, ffmpeg, ImageMagick, et les runtimes détectés à
partir des manifestes présents dans le repo. Il vérifie aussi que
**VideoToolbox** est disponible — c'est l'encodeur matériel Apple, et la raison
principale pour laquelle le MacBook Pro rendra bien plus vite que l'Air.

Pour les rendus longs, préférer :

```bash
ffmpeg -i in.mov -c:v h264_videotoolbox -b:v 12M out.mp4   # matériel, rapide
```

plutôt que `-c:v libx264` (CPU, c'est ce qui étranglait l'Air thermiquement).

## 3. Les pièges du changement de machine

| Piège | Symptôme | Correctif |
|---|---|---|
| **Polices manquantes** | Le texte change de rendu, ou disparaît | Installer les mêmes polices sur le Pro. Les lister sur l'Air : `fc-list \| sort` |
| **Chemins absolus en dur** | `No such file or directory` | Remplacer `/Users/<air>/…` par des chemins relatifs au repo |
| **Versions de ffmpeg différentes** | Sorties légèrement différentes | Comparer `ffmpeg -version` sur les deux machines |
| **Air Intel / Pro Apple Silicon** | Binaires ou wheels incompatibles | Réinstaller les dépendances depuis les manifestes, ne pas copier `node_modules` / `.venv` |
| **Médias sources absents** | Le rendu échoue au démarrage | Voir §4 |

## 4. Les médias, hors de git

Les vidéos et rushes n'ont rien à faire dans un repo git : ils le rendent
inclonable en quelques rendus. Un `.gitignore` est fourni dans ce dossier.

Pour les transférer de l'Air vers le Pro, au choix :

- **AirDrop** — le plus simple pour un transfert ponctuel ;
- **Disque externe** — le plus rapide pour des dizaines de Go ;
- **`rsync` sur le réseau local** — reprenable si la copie est interrompue :

  ```bash
  rsync -avP --partial ~/Videos/sources/ <user>@<macbook-pro>.local:~/Videos/sources/
  ```

Ranger les médias **hors du repo** (par exemple `~/Videos/alvisquest/`) et
laisser le pipeline pointer dessus via une variable d'environnement plutôt
qu'un chemin en dur :

```bash
export VIDEO_SOURCE_DIR="$HOME/Videos/alvisquest"
```

## 5. Vérifier que le portage est bon

Rendre **la même vidéo** sur les deux machines et comparer. Si les durées et
dimensions correspondent, le portage est fonctionnel :

```bash
ffprobe -v error -show_entries format=duration \
        -show_entries stream=width,height,codec_name \
        -of default=noprint_wrappers=1 out.mp4
```

Comparer aussi les temps de rendu : c'était le motif du changement de machine.

```bash
time ./video-production/<script-de-rendu>
```
