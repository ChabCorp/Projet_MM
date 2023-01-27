# /usr/local/bin/scwrl4/Scwrl4 –i 4r7l_mod.BL00090017.pdb –o scwrl4.pdb

# # gromax
source /usr/local/gromacs2020.5/bin/GMXRC
gmx pdb2gmx -f 4r7l_mod.BL00090017.pdb -o 4r7l_mod.BL00090017.gro -p 4r7l_mod.BL00090017.top -i 4r7l_mod.BL00090017.itp -ignh
wait

gmx grompp -f mini.mdp -c 4r7l_mod.BL00090017.gro -p 4r7l_mod.BL00090017.top -o minimodel.tpr
wait

gmx mdrun -v -deffnm minimodel
wait

gmx editconf -f minimodel.gro -o minimodel.pdb
wait
