return {
    descriptions = {
        Joker = {
            j_kcvanilla_5day = {
                name = "Prévisions sur cinq jours",
                text = {"Si la main jouée contient", "une {C:attention}Suite{}, augmente",
                        "le rang des cartes jouées de {C:attention}1{}",
                        "{C:inactive}(Exclut les {C:attention}As{C:inactive})"}
            },
            j_kcvanilla_chan = {
                name = "Joker-chan",
                text = {"À la fin du round, gagne", "{C:mult}+#1#{} Multi pour chaque", "{C:blue}Joker Commun{}",
                        "{C:inactive}(Actuellement {C:mult}+#2#{C:inactive} Multi){}"}
            },
            j_kcvanilla_collapse = {
                name = "Effondrement Cosmique",
                text = {'À la fin du round, chaque carte',
                        '{C:planet}Planète{} tenue a {C:green}#1# chance sur #2#{}',
                        'de se transformer en {C:spectral}Trou Noir{}'}
            },
            j_kcvanilla_composition = {
                name = "Composition",
                text = {"{C:mult}+#1#{} Multi pour chaque Joker à gauche,",
                        "{C:chips}+#2#{} Jetons pour chaque Joker à droite",
                        "{C:inactive}(Actuellement {C:mult}+#3#{C:inactive} Multi et {C:chips}+#4#{C:inactive} Jetons){}"}
            },
            j_kcvanilla_energy = {
                name = "Joker Énergie ",
                text = {'Les cartes {C:attention}Jokers{} jouées donnent l\'un',
                        'des effets suivants lorsqu’elles marquent :',
                        '{C:mult}+#1#{} Multi, {C:chips}+#2#{} Jetons, {X:mult,C:white} X#3# {} Multi, {C:money}$#4#{}'}
            },
            j_kcvanilla_fortunecookie = {
                name = "Biscuit Chinois",
                text = {"{C:chips}+#1#{} Jetons,", "{C:chips}-#2#{} Jetons quand une",
                        "carte {C:tarot}Tarot{} est utilisée"}
            },
            j_kcvanilla_guard = {
                name = "Garde Royal",
                text = {"Si la main jouée ne contient",
                         "aucun {C:attention}Roi{} ni {C:attention}Reine{}",
                         "{C:chips}+#1#{} Jetons pour chaque",
                         "{C:attention}Roi{} ou {C:attention}Reine{} dans votre {C:attention}Jeu complet{}.",
                         "{C:inactive}(Actuellement {C:chips}+#2#{C:inactive} Jetons)"}		
            },
            j_kcvanilla_handy = {
                name = "Joker Pratique",
                text = {'Si la {C:attention}première défausse{} du round', 'est une seule carte améliorée,',
                        'gagne {X:mult,C:white} X1 {} Multi, se réinitialise', 'lorsque la Blinde de Boss est vaincu',
                        '{C:inactive}(Actuellement {X:mult,C:white} X#1# {C:inactive} Multi)'}
            },
            j_kcvanilla_irish = {
                name = "Chance Irlandaise",
                text = {"Les cartes {C:attention}Chance{} {C:clubs}Trèfles{} ont {C:green}#1#X{}",
                        "plus de chances de réussir"}
            },
            j_kcvanilla_powergrid = {
                name = "Réseau Énergétique",
                text = {'Les cartes {C:attention}Multi{} marquées', 'donnent {X:mult,C:white} X#1# {} Multi',
                        'pour chaque carte {C:attention}Multi{}', 'marquée ce round',
                        "{C:inactive}(Prochain : {X:mult,C:white} X#2# {C:inactive} Multi)"}
            },
            j_kcvanilla_redenvelope = {
                name = "Enveloppe Rouge",
                text = {'Lorsque la Blinde de Boss est', 'vaincu, gagnez {C:money}$8{} pour',
                        'chaque {C:blue}Joker Commun{}', '{C:inactive}(Actuellement {C:money}$#1#{C:inactive})'}
            },
            j_kcvanilla_robo = {
                name = "Jimbot",
                text = {"Gagne la valeur en {C:chips}Jetons{}", "de la première carte numérotée",
                        "qui marque à chaque round", "{C:inactive}(Actuellement {C:chips}+#1#{C:inactive} Jetons)"}
            },
            j_kcvanilla_scapegoat = {
                name = "Bouc Émissaire",
                text = {'Si la {C:attention}première défausse{} du round',
                        'contient seulement {C:attention}1{} carte,',
                        'la détruit et ajoute sa valeur en {C:chips}Jetons{}', 'à une carte aléatoire en main'}
            },
            j_kcvanilla_squid = {
                name = "Calmar",
                text = {"{C:attention}+#1#{} taille de main lors des", "2 dernières mains du round",
                        "{C:inactive}(#2#)"}
            },
            j_kcvanilla_swiss = {
                name = "Joker Suisse",
                text = {'{C:mult}+#1#{} Multi pour chaque', 'carte qui n\'a pas marqué', 'dans la main précédente',
                        '{C:inactive}(Actuellement {C:mult}+#2#{C:inactive} Multi)'}
            },
            j_kcvanilla_tenpin = {
                name = "Quille",
                text = {'Si la main jouée contient', 'un {C:attention}10{} qui marque, {X:mult,C:white} X2 {} Multi',
                        'pour les 2 prochaines mains', '{C:inactive}(#1#){}'}
            },
            j_kcvanilla_rakugo = {
                name = "Rakugo",
                text = {'Si la main jouée contient une {C:attention}Suite{},',
                        'réactive chaque {C:attention}4 5 6 7{} ou {C:attention}8{} joué'}
            },
            j_kcvanilla_rats = {
                name = "Rat!",
                text = {'Quand le round commence, détruit', 'une carte aléatoire en main',
                        'et {C:attention}duplique{} ce Joker', '{C:inactive}(Doit avoir de la place,',
                        '{C:inactive}retire {C:dark_edition}Négatif{C:inactive} de la copie)'}
            },
            j_kcvanilla_loosetooth = {
                name = "Dent Perdue",
                text = {'Crée une carte {C:tarot}Tarot{} si', 'la main jouée contient',
                        'un {C:attention}As non-marquable{}', '{C:inactive}(Doit avoir de la place){}'}
            }
        }
    },
    misc = {
        dictionary = {
            kcv_active = "Actif",
            kcv_inactive = "Inactif",
            kcv_rats_msg = "Rat !",
            kcv_discover_all = "Tout découvrir",
            kcv_undiscover_all = "Tout oublier"
        },
        v_dictionary = {
            kcv_active_for_X_more_hands = "Actif pour #1# main(s) de plus"
        }
    }
}

