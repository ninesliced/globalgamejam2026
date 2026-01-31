extends Node2D

var conditions = [
    {
        text = "Je suis heureux",
        check = (func(mask: Mask): pass),
    },
]

func check(conditions, mask: Mask) -> bool:
    for cond in conditions:
        var c = cond.check(mask)
        if not c:
            return false

    return true