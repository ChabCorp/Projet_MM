for file in $(find ./useless -type f -name '*.pdb'); do
    mod9.11 get_DOPE.py $file
    grep 'DOPE score' get_DOPE.log | awk '{print($4)}' >> DOPE.log

    mod9.11 get_ga341.py $file
    grep 'GA341 score' get_ga341.log | awk '{print($4)}' >> DOPE.log
    echo -n $file >> DOPE.log
    echo >> DOPE.log
done