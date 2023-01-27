mod9.11 Model_test.py -v
# find . -type f  ! -name "*.pdb"  -delete
# grep FUNCTION 4r7l_mod.BL000*
# grep FUNCTION 4r7l_mod.BL000* | awk '{if ($5 > max){max=$5;max_file=$1}} END {print max_file}' | sed 's/\.[^.]*:\w*$//'

# should be change in function of output
# $best_model = grep FUNCTION 4r7l_mod.BL000* | awk '{if ($5 > max){max=$5;max_file=$1}} END {print max_file}' | sed 's/\.[^.]*:\w*$//'
$best_model = "4r7l_mod.BL00090017"
# mkdir results 
# mv 4r7l_mod.BL00090017.pdb" results
cd results

/usr/local/bin/scwrl4/Scwrl4 –i 4r7l_mod.BL00090017.pdb –o scwrl4.pdb

# gromax
source /usr/local/gromacs2020.5/bin/GMXRC
gmx pdb2gmx -f 4r7l_mod.BL00090017.pdb -o 4r7l_mod.BL00090017.gro -p 4r7l_mod.BL00090017.top -i 4r7l_mod.BL00090017.itp -ignh
wait

gmx grompp -f mini.mdp -c 4r7l_mod.BL00090017.gro -p 4r7l_mod.BL00090017.top -o minimodel.tpr
wait

gmx mdrun -v -deffnm minimodel
wait

gmx editconf -f minimodel.gro -o minimodel.pdb
wait
