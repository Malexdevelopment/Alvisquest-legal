# Relire le travail à distance

Tu veux produire sur le MacBook Pro du coéquipier et pouvoir visionner le
travail depuis ta machine. Voici ce que Claude Code remote permet — et ce
qu'il ne permet pas.

## Ce que Claude Code remote fait, et ne fait pas

Une session Claude Code remote tourne dans un **conteneur Linux éphémère dans
le cloud**. Vérifié sur cette session : `Ubuntu 24.04`, `x86_64`, pas de
`ffmpeg`, pas de GPU.

| | Remote (cloud Linux) | Claude Code local sur le MacBook Pro |
|---|---|---|
| Modifier le code du pipeline | ✅ | ✅ |
| Lancer un rendu vidéo | ❌ pas de ffmpeg, pas de GPU | ✅ |
| Encodage VideoToolbox | ❌ c'est du macOS | ✅ |
| Accès aux médias sources locaux | ❌ | ✅ |
| Accessible depuis ton téléphone / ton Mac | ✅ | ❌ machine allumée requise |

**Une session remote ne peut pas piloter le MacBook Pro.** Ce sont deux
machines sans lien : la session remote ne voit que le repo git.

## Le workflow qui marche

```
      toi, n'importe où                    MacBook Pro du coéquipier
      ─────────────────                    ─────────────────────────
   Claude Code remote
   modifie le pipeline
           │
           │  git push
           ▼
      ┌─────────┐   git pull    ┌──────────────────────────┐
      │  GitHub │ ────────────► │  Claude Code local       │
      │  (repo) │               │  lance le rendu (ffmpeg) │
      └─────────┘ ◄──────────── │  pousse un proxy léger   │
           │        git push     └──────────────────────────┘
           │
           ▼
   tu relis le proxy
```

1. **Toi, depuis n'importe où** : session Claude Code remote sur la branche de
   travail, pour faire évoluer le code du pipeline. Push.
2. **Sur le MacBook Pro** : `git pull`, puis Claude Code lancé **en local** sur
   cette machine pour lancer les rendus. C'est là que ffmpeg et VideoToolbox
   tournent.
3. **Pour la relecture** : le MacBook Pro pousse un **proxy léger** (voir
   ci-dessous), pas le master.

## Pousser un proxy relisible

Un master de plusieurs Go n'a rien à faire dans git. Un proxy de quelques Mo,
suffisant pour valider le montage, le texte et le timing, oui :

```bash
# ~5-15 Mo pour quelques minutes — relisible directement sur GitHub
ffmpeg -i master.mov \
       -vf "scale=-2:480" -c:v libx264 -crf 30 -preset veryfast \
       -c:a aac -b:a 96k \
       preview.mp4
```

Encore plus léger, pour valider d'un coup d'œil sans télécharger de vidéo —
une planche de vignettes :

```bash
# 4x3 vignettes réparties dans la vidéo, ~200 Ko
ffmpeg -i master.mov -vf "fps=1/10,scale=320:-2,tile=4x3" -frames:v 1 contact-sheet.jpg
```

Les deux se relisent directement dans l'interface GitHub, et une session
Claude Code remote peut les lire depuis le repo.

### Si les proxys deviennent trop nombreux

Les commiter finit quand même par alourdir le repo. Deux alternatives :

- **Une release GitHub par version de rendu** — les binaires y vivent hors de
  l'historique git, et restent téléchargeables par lien.
- **Un stockage partagé** (Drive, S3) avec un lien dans le commit ou la PR.

## En pratique

Sur le MacBook Pro, après un rendu :

```bash
ffmpeg -i master.mov -vf "scale=-2:480" -c:v libx264 -crf 30 -preset veryfast preview.mp4
git add preview.mp4 && git commit -m "render: preview du plan d'ouverture" && git push
```

Depuis ta session remote, tu récupères le proxy, tu le relis, tu ajustes le
pipeline, tu repousses. Le MacBook Pro n'a plus qu'à `git pull` et relancer.
