SELECT
    ID AS COL0,
    UnitName AS COL1,
    IncidentNumber AS COL2,
    DateTimeReceived AS COL3,
    Address AS COL4,
    ResponseArea AS COL5,
    ProblemDescription AS COL6,
    TimeAssigned AS COL7,
    TimeEnroute AS COL8,
    TimeArrived AS COL9,
    ProcessingTime AS COL10,
    TurnoutTime AS COL11,
    TravelTime AS COL12
FROM
    ResponseTimes
WHERE
    (
        GenericProblemDescription LIKE 'Medical%'
        OR GenericProblemDescription LIKE 'Structure Fire%'
    )
    AND
    (
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
    AND DateTimeReceived >= '2019-05-14 00:00:00'
    AND DateTimeReceived <= '2020-05-01 23:59:59'
    AND TimeEnroute <> '1970-01-01 00:00:00.0%'
    AND TimeArrived <> '1970-01-01 00:00:00.0%'
    AND UnitName NOT LIKE 'CF%'
    AND UnitName NOT LIKE 'CARY%'
    AND UnitName NOT LIKE 'RF%'
    AND UnitName NOT LIKE 'WC%'
    AND TravelTime <> '0'
    AND TravelTime IN
    (
        SELECT
            MIN( TravelTime ) AS TheMinTT
        FROM
            ResponseTimes
        WHERE
        (
            GenericProblemDescription LIKE 'Medical%'
            OR GenericProblemDescription LIKE 'Structure Fire%'
        )
        AND
        (
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
                    UnitName LIKE 'FVE%' OR
                    UnitName LIKE 'FVL%' OR
                    UnitName LIKE 'FVR%' OR
                    UnitName LIKE 'FVP%'
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
                    UnitName LIKE 'HOE%' OR
                    UnitName LIKE 'HOL%' OR
                    UnitName LIKE 'HOR%' OR
                    UnitName LIKE 'HOP%'
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
        AND DateTimeReceived >= '2019-05-14 00:00:00'
        AND DateTimeReceived <= '2020-05-01 23:59:59'
        AND TimeEnroute <> '1970-01-01 00:00:00.0%'
        AND TimeArrived <> '1970-01-01 00:00:00.0%'
        AND UnitName NOT LIKE 'CF%'
        AND UnitName NOT LIKE 'CARY%'
        AND UnitName NOT LIKE 'RF%'
        AND UnitName NOT LIKE 'WC%'
        AND TravelTime <> '0'
        GROUP BY IncidentNumber
        ORDER BY IncidentNumber ASC
    )
ORDER BY IncidentNumber ASC
