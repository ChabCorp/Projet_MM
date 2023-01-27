source /usr/local/gromacs2020.5/bin/GMXRC
# # mkdir results_Dynamique
# # cp 4r7l_mod.BL00090017.pdb Results_Dynamique
# # cp mini1.mdp results_Dynamique
# # cp mini2.mdp results_Dynamique 
# # cd results_Dynamique
# echo "$PWD"
gmx pdb2gmx -f 4r7l_mod.BL00090017.pdb -o 4r7l_mod.BL00090017.gro -p 4r7l_mod.BL00090017.top -i 4r7l_mod.BL00090017.itp -ignh
wait
gmx editconf -f 4r7l_mod.BL00090017.gro -d 1.4 -o 4r7l_mod.BL00090017_box.gro
wait 
gmx solvate -cp 4r7l_mod.BL00090017_box.gro -cs spc216.gro -p 4r7l_mod.BL00090017.top -o 4r7l_mod.BL00090017_water.gro
wait
# Ajout fichier mini1
gmx grompp -f mini1.mdp -c 4r7l_mod.BL00090017_water.gro -p 4r7l_mod.BL00090017.top -o mini1.tpr
wait
gmx mdrun -v -deffnm mini1
wait
gmx grompp -f mini1.mdp -c mini1.gro -p 4r7l_mod.BL00090017.top -o dummy.tpr
wait
gmx genion -s dummy.tpr -p 4r7l_mod.BL00090017.top -o 4r7l_mod.BL00090017_wations.gro -conc 0.12 -pname NA -nname CL -neutral
wait
# Ajout fichier mini2
gmx grompp -f mini2.mdp -p 4r7l_mod.BL00090017.top -c 4r7l_mod.BL00090017_wations.gro -o mini2.tpr
wait
gmx mdrun -v -deffnm mini2
wait 

# Dynamique moléculaire 
gmx make_ndx -f mini2.gro -o index.ndx
# 13|16|17
# name 19 SOL_IONS
wait 
gmx grompp -f md_eq.mdp -p 4r7l_mod.BL00090017.top -c mini2.gro -n index.ndx -r mini2.gro -o md_eq.tpr -maxwarn 2
wait
gmx mdrun -v -deffnm md_eq

#Create md_prod.mdp 
gmx grompp -f md_prod.mdp -p 4r7l_mod.BL00090017.top -c md_eq.gro  -n index.ndx -o md_prod.tpr
gmx mdrun -s md_prod.tpr -deffnm md_prod 
# nohup gmx mdrun -deffnm tutu -ntmpi 2 -ntop 3 & 
# GROMACS tutorial sur le web 