extends Node2D

var conditions = [
    {
        text = "Le destin suivra son cours.",
        # Has 1 red eye or more
        check = func(mask: Mask): \
            return mask.count_with_color_and_type(MaskElement.ElementColor.RED, MaskElement.ElementType.EYE) >= 1,
    },
    {
        text = "Le cours suivra son destin.",
        # Has 1 pink eye or more
        check = func(mask: Mask): \
            return mask.count_with_color_and_type(MaskElement.ElementColor.PINK, MaskElement.ElementType.EYE) >= 1,
    },
]

func check(conditions, mask: Mask) -> bool:
    for cond in conditions:
        var c = cond.check(mask)
        if not c:
            return false

    return true