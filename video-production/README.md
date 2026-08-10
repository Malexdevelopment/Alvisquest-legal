# Production vidéo — portage MacBook Air → MacBook Pro

## Le problème

Le pipeline de génération vidéo tournait sur un MacBook Air et rendait mal
(thermique, RAM, pas d'encodeur matériel suffisant pour des rendus longs).
L'objectif : produire sur le MacBook Pro du coéquipier, et pouvoir suivre /
relire le travail à distance.

## L'architecture qui marche

Trois rôles distincts, sur trois machines différentes. C'est le point à
comprendre avant tout le reste :

| Rôle | Où | Pourquoi |
|---|---|---|
| **Écrire / modifier le pipeline** | Claude Code remote (conteneur cloud Linux) ou en local | Du code, pas du rendu. Portable partout. |
| **Rendre les vidéos** | MacBook Pro, en local | Apple Silicon + VideoToolbox + les médias sources. |
| **Relire le résultat** | N'importe où | Via des proxys légers poussés sur git, ou un stockage partagé. |

### Ce que Claude Code remote ne peut pas faire

Une session Claude Code remote s'exécute dans un conteneur **Linux éphémère
dans le cloud** — vérifié sur cette session : `Ubuntu 24.04`, `x86_64`, pas de
`ffmpeg`, pas de `/dev/dri` (donc pas de GPU). Concrètement :

- Elle **ne peut pas** piloter le MacBook Pro ni y lancer un rendu.
- Elle **ne peut pas** encoder en VideoToolbox (c'est du macOS/Apple Silicon).
- Elle **ne peut pas** voir les médias sources qui vivent sur les disques locaux.
- Le conteneur est **recyclé** après inactivité : tout ce qui n'est pas commité
  et poussé est perdu.

Donc : **le rendu se fait sur le MacBook Pro, avec le CLI Claude Code lancé
localement sur cette machine.** La session remote sert à faire évoluer le code
du pipeline et à relire les résultats poussés sur le repo.

## Mise en route sur le MacBook Pro

```bash
git clone <ce-repo> && cd <ce-repo>
./video-production/setup-macos.sh
```

Puis, sur le MacBook Pro, lancer Claude Code **en local** dans le repo pour
piloter les rendus :

```bash
claude
```

Voir [`MIGRATION.md`](MIGRATION.md) pour la checklist de portage complète
(ce qu'il faut ramener depuis le MacBook Air) et
[`REMOTE-REVIEW.md`](REMOTE-REVIEW.md) pour la relecture à distance.

## État actuel

Le pipeline lui-même n'est **pas encore dans ce repo** — il n'existait qu'en
local sur le MacBook Air, non versionné. Ce dossier fournit l'infrastructure
d'accueil (installation, portage, relecture). L'étape suivante est d'y copier
les scripts de génération : voir la section « Ramener le pipeline » de
[`MIGRATION.md`](MIGRATION.md).
