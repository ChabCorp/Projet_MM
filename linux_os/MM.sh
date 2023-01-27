mod9.11 Model_test.py -v
# grep FUNCTION 4r7l_mod.BL000* 

# should be change in function of output
# $best_model = grep FUNCTION 4r7l_mod.BL000* | awk '{if ($5 > max){max=$5;max_file=$1}} END {print max_file}' | sed 's/\.[^.]*:\w*$//'
$best_model = "4r7l_mod.BL00090017"
# mkdir results 
# mv 4r7l_mod.BL00090017.pdb" results