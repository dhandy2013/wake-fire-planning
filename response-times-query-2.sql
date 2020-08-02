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
        IsRuralResponse
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
            IsRuralResponse
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
