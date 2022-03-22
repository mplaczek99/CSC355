/*
Michael Placzek
CSC 355 Section 531
Assignment 6
3/6/2022
*/

DECLARE
    cutoff CUTOFFS.highMPG%TYPE;

    truck FLEET%ROWTYPE;
    cursor truckPtr is SELECT * FROM FLEET;

    highCount INTEGER;

    totalMiles NUMBER;
    totalGallons NUMBER;
    mpg NUMBER;
BEGIN
    SELECT highMPG
    INTO cutoff
    FROM CUTOFFS;

    -- prints cutoff
    dbms_output.put_line('High MPG cutoff is ' || cutoff);
    dbms_output.put_line(''); -- formatting

    highCount:=0;
    totalMiles:=0;
    totalGallons:=0;

    for truck in truckPtr
    loop
        -- calculate mpg
        mpg:=ROUND(truck.miles / truck.gallons,2);

        -- print truck information
        dbms_output.put('Truck ' || truck.truckID || ': ');
        dbms_output.put(truck.truckmodel);
        dbms_output.put(mpg);

        -- special case where mpg is >= cutoff
        if mpg >= cutoff then
            highCount:=highCount + 1;
            dbms_output.put(' HIGH');
        end if;

        -- add each truck's miles and gallons to a total counter
        totalMiles:=totalMiles + truck.miles;
        totalGallons:=totalGallons + truck.gallons;

        dbms_output.put_line(''); -- formatting
    end loop;
    dbms_output.put_line(''); -- formatting

    -- calculate the overall mpg
    mpg:=ROUND(totalMiles / totalGallons,2);

    -- print the extra information
    dbms_output.put_line('Overall fleet MPG: ' || mpg);
    dbms_output.put_line('Trucks with high MPG: ' || highCount);
END;