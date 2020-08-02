UPDATE ResponseTimes
SET IsRuralResponse = (
    (
        ResponseArea LIKE 'AFD RURAL%'
        AND
        (
            UnitName LIKE 'AFE%'
            OR UnitName LIKE 'AFL%'
            OR UnitName LIKE 'AFR%'
            OR UnitName LIKE 'AFP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'MFD RURAL%'
        AND
        (
            UnitName LIKE 'MFE%'
            OR UnitName LIKE 'MFL%'
            OR UnitName LIKE 'MFR%'
            OR UnitName LIKE 'MFP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'DHFD RURAL%'
        AND
        (
            UnitName LIKE 'DHE%'
            OR UnitName LIKE 'DHL%'
            OR UnitName LIKE 'DHR%'
            OR UnitName LIKE 'DHP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'NHFD RURAL%'
        AND
        (
            UnitName LIKE 'NHE%'
            OR UnitName LIKE 'NHL%'
            OR UnitName LIKE 'NHR%'
            OR UnitName LIKE 'NHP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'EWFD RURAL%'
        AND
        (
            UnitName LIKE 'EWE%'
            OR UnitName LIKE 'EWL%'
            OR UnitName LIKE 'EWR%'
            OR UnitName LIKE 'EWP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'NWFD RURAL%'
        AND
        (
            UnitName LIKE 'NWE%'
            OR UnitName LIKE 'NWL%'
            OR UnitName LIKE 'NWR%'
            OR UnitName LIKE 'NWP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'FFD RURAL%'
        AND
        (
            UnitName LIKE 'FFE%'
            OR UnitName LIKE 'FFL%'
            OR UnitName LIKE 'FFR%'
            OR UnitName LIKE 'FFP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'ROFD RURAL%'
        AND
        (
            UnitName LIKE 'RVE%'
            OR UnitName LIKE 'RVL%'
            OR UnitName LIKE 'RVR%'
            OR UnitName LIKE 'RVP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'FVFD RURAL%'
        AND
        (
            UnitName LIKE 'FVE%'
            OR UnitName LIKE 'FVL%'
            OR UnitName LIKE 'FVR%'
            OR UnitName LIKE 'FVP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'SCFD RURAL%'
        AND
        (
            UnitName LIKE 'SCE%'
            OR UnitName LIKE 'SCL%'
            OR UnitName LIKE 'SCR%'
            OR UnitName LIKE 'SCP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'GFD RURAL%'
        AND
        (
            UnitName LIKE 'GFE%'
            OR UnitName LIKE 'GFL%'
            OR UnitName LIKE 'GFR%'
            OR UnitName LIKE 'GFP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'WFD RURAL%'
        AND
        (
            UnitName LIKE 'WEE%'
            OR UnitName LIKE 'WEL%'
            OR UnitName LIKE 'WER%'
            OR UnitName LIKE 'WEP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'HOPFD RURAL%'
        AND
        (
            UnitName LIKE 'HOE%'
            OR UnitName LIKE 'HOL%'
            OR UnitName LIKE 'HOR%'
            OR UnitName LIKE 'HOP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'WFFD RURAL%'
        AND
        (
            UnitName LIKE 'WFE%'
            OR UnitName LIKE 'WFL%'
            OR UnitName LIKE 'WFR%'
            OR UnitName LIKE 'WFP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'HSFD RURAL%'
        AND
        (
            UnitName LIKE 'HSE%'
            OR UnitName LIKE 'HSL%'
            OR UnitName LIKE 'HSR%'
            OR UnitName LIKE 'HSP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'WWFD RURAL%'
        AND
        (
            UnitName LIKE 'WWE%'
            OR UnitName LIKE 'WWL%'
            OR UnitName LIKE 'WWR%'
            OR UnitName LIKE 'WWP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'KFD RURAL%'
        AND
        (
            UnitName LIKE 'KCE%'
            OR UnitName LIKE 'KCL%'
            OR UnitName LIKE 'KCR%'
            OR UnitName LIKE 'KCP%'
        )
    )
    OR
    (
        ResponseArea LIKE 'ZFD RURAL%'
        AND
        (
            UnitName LIKE 'ZFE%'
            OR UnitName LIKE 'ZFL%'
            OR UnitName LIKE 'ZFR%'
            OR UnitName LIKE 'ZFP%'
        )
    ) 
)
