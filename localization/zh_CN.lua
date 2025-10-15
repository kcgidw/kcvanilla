return {
    descriptions = {
        Joker = {
            j_kcvanilla_5day = {
                name = "五日天气预报",
                text = {
                    "若打出的手牌包含",
                    "一个{C:attention}顺子{}，则将",
                    "所打牌的点数提升{C:attention}1{}点",
                    "{C:inactive}（{C:attention}A牌{C:inactive}除外{C:inactive}）"
                }
            },
            j_kcvanilla_chan = {
                name = "小丑Chan",
                text = {
                    "每回合结束时，每有1张",
                    "{C:blue}普通{}小丑，获得",
                    "{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前：{C:mult}+#2#{C:inactive}）{}"
                }
            },
            j_kcvanilla_collapse = {
                name = "宇宙坍缩",
                text = {
                    '每回合结束时，持有的{C:planet}星球{}牌',
                    '各有{C:green}#1#/#2#{}的几率',
                    '转化为一张{C:spectral}黑洞{}'
                }
            },
            j_kcvanilla_composition = {
                name = "构图",
                text = { "左侧每有1张小丑，获得{C:mult}+#1#{}倍率，",
                    "右侧每有1张小丑，获得{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前获得{C:mult}+#3#{C:inactive}倍率和{C:chips}+#4#{C:inactive}筹码）{}" }
            },
            j_kcvanilla_energy = {
                name = "小丑能量",
                text = {
                    '打出的{C:attention}万能{}牌在计分时',
                    '随机提供以下效果之一：',
                    '{C:mult}+#1#{}倍率，{C:chips}+#2#{}筹码，{X:mult,C:white} ×#3# {}倍率，{C:money}$#4#{}'
                }
            },
            j_kcvanilla_fortunecookie = {
                name = "幸运饼干",
                text = {
                    "获得{C:chips}+#1#{}筹码，",
                    "但使用{C:tarot}塔罗{}牌时",
                    "会失去{C:chips}-#2#{}筹码"
                }
            },
            j_kcvanilla_guard = {
                name = "皇家卫士",
                text = {
                    "在{C:attention}#2#{}张{C:attention}K{}或{C:attention}Q{}计分后，",
                    "出售此牌可使一张随机小丑变为{C:dark_edition}负片{}",
                    "{C:inactive}（进度：#1#/#2#）{}"
                }
            },
            j_kcvanilla_handy = {
                name = "灵巧小丑",
                text = {
                    '若本回合{C:attention}首次弃牌{}',
                    '为单张增强牌，',
                    '则获得{X:mult,C:white} ×1 {}倍率，',
                    '击败{C:attention}Boss盲注{}后重置',
                    '{C:inactive}（当前为{X:mult,C:white} ×#1# {C:inactive}倍率）'
                }
            },
            j_kcvanilla_irish = {
                name = "爱尔兰好运",
                text = {
                    "{C:clubs}梅花{}花色的{C:attention}幸运牌",
                    "成功概率提升至原来的{C:green}#1#倍{}"
                }
            },
            j_kcvanilla_powergrid = {
                name = "电网",
                text = {
                    '本回合每有1张计分的{C:attention}倍率{}牌，',
                    '所有计分的{C:attention}倍率{}牌',
                    '额外提供{X:mult,C:white} ×#1# {}倍率',
                    "{C:inactive}（下一次：{X:mult,C:white} ×#2# {C:inactive}倍率）"
                }
            },
            j_kcvanilla_redenvelope = {
                name = "红包",
                text = {
                    '击败首领盲注后，',
                    '每有1张{C:blue}普通{}小丑，',
                    '获得{C:money}$8{}',
                    '{C:inactive}（当前可获得{C:money}$#1#{C:inactive}）'
                }
            },
            j_kcvanilla_robo = {
                name = "吉姆机器人",
                text = {
                    "此小丑牌每回合获得首张计分",
                    "数字牌的{C:chips}筹码{}值",
                    "{C:inactive}（当前获得{C:chips}+#1#{C:inactive}筹码）"
                }
            },
            j_kcvanilla_scapegoat = {
                name = "替罪羊",
                text = {
                    '若本回合{C:attention}首次弃牌{}',
                    '仅有{C:attention}1{}张牌，',
                    '则将其销毁，并将其{C:chips}筹码{}值',
                    '加到手牌中的一张随机牌上'
                }
            },
            j_kcvanilla_squid = {
                name = "章鱼",
                text = {
                    "在每回合最后",
                    "2次出牌中，手牌上限{C:attention}+#1#{}",
                    "{C:inactive}（#2#）"
                }
            },
            j_kcvanilla_swiss = {
                name = "瑞士小丑",
                text = {
                    '上一手未计分的',
                    '每张牌，提供{C:mult}+#1#{}倍率',
                    '{C:inactive}（当前获得{C:mult}+#2#{C:inactive}倍率）'
                }
            },
            j_kcvanilla_tenpin = {
                name = "十瓶保龄",
                text = {
                    '若打出的手牌包含',
                    '一张计分的{C:attention}10{}，',
                    '则接下来2次出牌中获得{X:mult,C:white} ×2 {}倍率',
                    '{C:inactive}（#1#）{}'
                }
            },
            j_kcvanilla_rakugo = {
                name = "落语",
                text = {
                    '若打出的手牌包含一个{C:attention}顺子{}，',
                    '则重新触发每张打出的{C:attention}4、5、6、7{}或{C:attention}8{}'
                }
            },
            j_kcvanilla_rats = {
                name = "耗子！",
                text = {
                    '每回合开始时，随机销毁',
                    '手牌中的一张牌，',
                    '并{C:attention}复制{}此小丑',
                    '{C:inactive}（必须有空位，',
                    '{C:inactive}且复制体将移除{C:dark_edition}负面{C:inactive}状态）'
                }
            },
            j_kcvanilla_loosetooth = {
                name = "松动的牙齿",
                text = {
                    '若打出的手牌包含',
                    '一张{C:attention}未计分的A牌{}，',
                    '则生成一张{C:tarot}塔罗{}牌',
                    '{C:inactive}（必须有空位）{}'
                }
            }
        }
    },
    misc = {
        dictionary = {
            kcv_active = "激活",
            kcv_inactive = "未激活",
            kcv_rats_msg = "耗子！",
            kcv_discover_all = "发现所有小丑",
            kcv_undiscover_all = "隐藏所有小丑"
        },
        v_dictionary = {
            kcv_active_for_X_more_hands = "再持续#1#次出牌"
        }
    }
}
