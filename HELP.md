# 🚀 Guide Complet Neovim - Tous les Raccourcis

## 📁 Architecture des Dossiers

```
~/.config/nvim/
├── init.lua                 # Point d'entrée principal
├── lua/
│   ├── core/               # Configuration de base
│   │   ├── options.lua     # Options Neovim
│   │   ├── keymaps.lua     # Raccourcis globaux
│   │   └── autocmds.lua    # Autocommandes
│   ├── config/
│   │   └── lazy.lua        # Configuration du gestionnaire de plugins
│   └── plugins/            # Configurations des plugins
│       ├── colorscheme.lua # Thème
│       ├── ui.lua          # Interface utilisateur
│       ├── editor.lua      # Outils d'édition
│       ├── lsp.lua         # Language Server Protocol
│       ├── completion.lua  # Autocomplétion
│       └── treesitter.lua  # Syntaxe avancée
└── HELP.md                 # Ce fichier d'aide
```

## ⌨️ Raccourcis Clavier Complets

> **Leader key**: `Espace`

### 🔤 Mode Normal

#### Fichiers et Buffers
| Raccourci | Action |
|-----------|--------|
| `<leader>w` | Sauvegarder |
| `<leader>W` | Sauvegarder tous les fichiers |
| `<leader>q` | Quitter |
| `<leader>Q` | Forcer quitter tout |
| `<leader>x` | Sauvegarder et quitter |
| `<leader>bd` | Fermer buffer |
| `<leader>bD` | Fermer tous les autres buffers |
| `Shift+h` | Buffer précédent |
| `Shift+l` | Buffer suivant |

#### Navigation
| Raccourci | Action |
|-----------|--------|
| `Ctrl+h/j/k/l` | Naviguer entre fenêtres |
| `Ctrl+d` | Descendre demi-page (centré) |
| `Ctrl+u` | Monter demi-page (centré) |
| `n` | Recherche suivante (centrée) |
| `N` | Recherche précédente (centrée) |
| `gg` | Début du fichier |
| `G` | Fin du fichier |
| `{` / `}` | Paragraphe précédent/suivant |
| `%` | Aller à la parenthèse correspondante |

#### Mouvement par Mots (macOS)
| Raccourci | Action |
|-----------|--------|
| `Option+←/→` | Mot gauche/droite |
| `Option+b` | Mot précédent |
| `Option+w` | Mot suivant |
| `b` / `w` | Mot précédent/suivant (vim natif) |
| `e` / `ge` | Fin de mot suivant/précédent |

#### Fenêtres et Splits
| Raccourci | Action |
|-----------|--------|
| `<leader>sv` | Split vertical |
| `<leader>sh` | Split horizontal |
| `<leader>se` | Égaliser les splits |
| `<leader>sx` | Fermer split |
| `Ctrl+↑/↓` | Redimensionner hauteur |
| `Ctrl+←/→` | Redimensionner largeur |

#### Onglets
| Raccourci | Action |
|-----------|--------|
| `<leader>tn` | Nouvel onglet |
| `<leader>tc` | Fermer onglet |
| `<leader>to` | Fermer autres onglets |
| `Tab` | Onglet suivant |
| `Shift+Tab` | Onglet précédent |

### 🔍 Telescope (Recherche Fuzzy)
| Raccourci | Action |
|-----------|--------|
| `<leader>ff` | Rechercher fichiers |
| `<leader>fg` | Recherche dans le contenu (grep) |
| `<leader>fb` | Liste des buffers |
| `<leader>fh` | Pages d'aide |
| `<leader>fr` | Fichiers récents |
| `<leader>fc` | Commandes disponibles |
| `<leader>fk` | Tous les keymaps |
| `<leader>fs` | Recherche dans buffer actuel |
| `<leader>fd` | Diagnostics LSP |
| `<leader>fm` | Marques |
| `<leader>ft` | Liste des TODO |

### 🌲 Explorateur de Fichiers (NvimTree)
| Raccourci | Action |
|-----------|--------|
| `<leader>e` | Toggle explorateur |
| `<leader>ef` | Trouver fichier actuel |

**Dans l'explorateur:**
| Raccourci | Action |
|-----------|--------|
| `Enter` | Ouvrir fichier/dossier |
| `h` | Fermer dossier |
| `l` | Ouvrir dossier |
| `a` | Créer fichier/dossier |
| `r` | Renommer |
| `d` | Supprimer |
| `x` | Couper |
| `c` | Copier |
| `p` | Coller |
| `y` | Copier nom |
| `Y` | Copier chemin |
| `gy` | Copier chemin absolu |
| `H` | Toggle fichiers cachés |
| `R` | Rafraîchir |

### 💻 LSP (Language Server Protocol)
| Raccourci | Action |
|-----------|--------|
| `gd` | Aller à la définition |
| `gD` | Aller à la déclaration |
| `gi` | Aller à l'implémentation |
| `gr` | Voir les références |
| `gt` | Aller au type |
| `K` | Documentation (hover) |
| `Ctrl+k` | Signature de fonction |
| `<leader>lr` | Renommer symbole |
| `<leader>la` | Actions de code |
| `<leader>lf` | Formater le fichier |
| `<leader>ld` | Diagnostics de la ligne |
| `<leader>lq` | Liste des diagnostics |
| `<leader>lp` | Aperçu de définition |
| `<leader>lo` | Outline du code |
| `[d` | Diagnostic précédent |
| `]d` | Diagnostic suivant |

### 🎨 Formatage
| Raccourci | Action |
|-----------|--------|
| `<leader>cf` | Formater le fichier/sélection |
| `<leader>cF` | Toggle format automatique à la sauvegarde |

### 🐙 Git (Gitsigns)
| Raccourci | Action |
|-----------|--------|
| `]c` | Hunk suivant |
| `[c` | Hunk précédent |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gS` | Stage buffer complet |
| `<leader>gR` | Reset buffer complet |
| `<leader>gu` | Undo stage hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame ligne |
| `<leader>gtb` | Toggle blame |
| `<leader>gd` | Diff this |
| `<leader>gD` | Diff this ~ |
| `<leader>gtd` | Toggle deleted |

### 💬 Commentaires
| Raccourci | Action |
|-----------|--------|
| `gcc` | Commenter/décommenter ligne |
| `gbc` | Commenter/décommenter bloc |
| `gc` (visuel) | Commenter sélection |
| `gb` (visuel) | Commenter bloc sélection |
| `gcO` | Ajouter commentaire au-dessus |
| `gco` | Ajouter commentaire en-dessous |
| `gcA` | Ajouter commentaire fin de ligne |

### 🖥️ Terminal
| Raccourci | Action |
|-----------|--------|
| `Ctrl+\` | Toggle terminal flottant |
| `<leader>tf` | Terminal flottant |
| `<leader>th` | Terminal horizontal |
| `<leader>tv` | Terminal vertical |

**Dans le terminal:**
| Raccourci | Action |
|-----------|--------|
| `Esc` ou `jk` | Mode normal |
| `Ctrl+h/j/k/l` | Naviguer entre fenêtres |

### ✏️ Mode Insertion
| Raccourci | Action |
|-----------|--------|
| `jk` ou `jj` | Échapper (retour mode normal) |
| `Ctrl+h/l` | Gauche/Droite |
| `Ctrl+j/k` | Bas/Haut |
| `Ctrl+a` | Début de ligne |
| `Ctrl+e` | Fin de ligne |
| `Option+←/→` | Mot gauche/droite |
| `Option+b/w` | Mot précédent/suivant |

### 🎯 Mode Visuel
| Raccourci | Action |
|-----------|--------|
| `<` / `>` | Indenter gauche/droite |
| `J` / `K` | Déplacer sélection bas/haut |
| `p` | Coller sans perdre le registre |
| `gc` | Commenter sélection |

### 🔄 Autocomplétion (dans l'éditeur)
| Raccourci | Action |
|-----------|--------|
| `Tab` | Suggestion suivante |
| `Shift+Tab` | Suggestion précédente |
| `Enter` | Accepter suggestion |
| `Ctrl+Space` | Ouvrir suggestions |
| `Ctrl+e` | Fermer suggestions |
| `Ctrl+b/f` | Scroll docs |

### 🎨 Surround (entourage de texte)
| Raccourci | Action |
|-----------|--------|
| `ys{motion}{char}` | Entourer avec caractère |
| `ds{char}` | Supprimer entourage |
| `cs{old}{new}` | Changer entourage |
| `S{char}` (visuel) | Entourer sélection |

**Exemples:**
- `ysiw"` : Entourer mot avec guillemets
- `ds"` : Supprimer guillemets
- `cs"'` : Changer " en '

### 🔧 Toggle Settings
| Raccourci | Action |
|-----------|--------|
| `<leader>uw` | Toggle wrap |
| `<leader>un` | Toggle numéros relatifs |
| `<leader>us` | Toggle spell check |
| `Esc` | Clear highlight recherche |

### 📋 Quickfix & Location List
| Raccourci | Action |
|-----------|--------|
| `<leader>co` | Ouvrir quickfix |
| `<leader>cc` | Fermer quickfix |
| `[q` / `]q` | Quickfix précédent/suivant |
| `<leader>lo` | Ouvrir location list |
| `<leader>lc` | Fermer location list |
| `[l` / `]l` | Location précédente/suivante |

### 🎯 Treesitter Text Objects
| Raccourci | Action |
|-----------|--------|
| `vaf` | Sélectionner fonction (outer) |
| `vif` | Sélectionner fonction (inner) |
| `vac` | Sélectionner classe (outer) |
| `vic` | Sélectionner classe (inner) |
| `vaa` | Sélectionner paramètre (outer) |
| `via` | Sélectionner paramètre (inner) |

### 📝 Macros
| Raccourci | Action |
|-----------|--------|
| `qa` | Enregistrer macro dans 'a' |
| `q` | Arrêter enregistrement |
| `@a` | Exécuter macro 'a' |
| `Q` | Exécuter macro 'q' |
| `@@` | Répéter dernière macro |

### 🚀 TODO Comments
| Raccourci | Action |
|-----------|--------|
| `]t` | TODO suivant |
| `[t` | TODO précédent |
| `<leader>ft` | Liste tous les TODO |

**Keywords supportés:**
- `TODO:` - Tâche à faire
- `FIX:` / `FIXME:` / `BUG:` - Bug à corriger
- `HACK:` - Solution temporaire
- `WARN:` / `WARNING:` - Avertissement
- `PERF:` / `OPTIMIZE:` - Optimisation nécessaire
- `NOTE:` / `INFO:` - Information importante
- `TEST:` - Test nécessaire

## 🛠️ Commandes Utiles

### Lazy (Gestionnaire de Plugins)
- `:Lazy` - Interface de gestion des plugins
- `:Lazy update` - Mettre à jour les plugins
- `:Lazy sync` - Synchroniser les plugins
- `:Lazy clean` - Nettoyer les plugins inutilisés

### Mason (Gestionnaire LSP)
- `:Mason` - Interface de gestion des LSP
- `:MasonUpdate` - Mettre à jour Mason
- `:MasonInstall <server>` - Installer un serveur LSP

### Telescope
- `:Telescope` - Voir toutes les commandes Telescope
- `:Telescope help_tags` - Rechercher dans l'aide

### Divers
- `:checkhealth` - Vérifier la santé de Neovim
- `:TSInstall <language>` - Installer support Treesitter
- `:ConformInfo` - Info sur les formatters

## 💡 Tips & Tricks

1. **Which-key**: Appuyez sur `<leader>` et attendez pour voir tous les raccourcis disponibles

2. **Recherche rapide**:
   - `/` pour rechercher
   - `*` pour rechercher le mot sous le curseur
   - `Ctrl+/` dans Telescope pour voir l'historique

3. **Navigation rapide**:
   - `Ctrl+o` pour revenir en arrière dans l'historique
   - `Ctrl+i` pour avancer dans l'historique
   - `''` pour revenir à la dernière position

4. **Édition rapide**:
   - `ci"` pour changer le contenu entre guillemets
   - `da(` pour supprimer autour des parenthèses
   - `.` pour répéter la dernière commande

5. **Multi-curseurs** (avec substitution):
   - `:%s/old/new/g` - Remplacer dans tout le fichier
   - `:s/old/new/g` - Remplacer dans la ligne
   - Visual + `:s/old/new/g` - Remplacer dans la sélection

6. **Marks (marques)**:
   - `ma` - Créer marque 'a'
   - `'a` - Aller à la marque 'a'
   - `:marks` - Voir toutes les marques

## 🔄 Mise à jour

Pour mettre à jour cette configuration:
1. `:Lazy update` - Mettre à jour les plugins
2. `:TSUpdate` - Mettre à jour Treesitter
3. `:MasonUpdate` - Mettre à jour les serveurs LSP

---

**Rappel**: Leader key = `Espace`

Pour voir ce fichier dans Neovim: `:e ~/.config/nvim/HELP.md`
