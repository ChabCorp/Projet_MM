source /usr/local/gromacs2020.5/bin/GMXRC

# ## pbc whole pour laisser l'objet en entier 
# ## skip enregistre une trajectoire tout les 10 points
# ## -center => centrer dans la box
# ## -fit éviter les translations/rotations => rot+trans 
# ## 
gmx trjconv -f md_prod.xtc -s md_prod.tpr -n index.ndx -o traj_prot_skip10.xtc -pbc whole -skip 10 -center ## 1 & 1 
wait
gmx trjconv -f traj_prot_skip10.xtc -s md_prod.tpr -n index.ndx -o traj_prot_skip10_fit.xtc -fit rot+trans ## 1 & 1 

wait
## Get NRJ 
gmx energy -f md_prod.edr -o energy.xvg ## 12 \n 13 \n 14 \n \n 
wait
## show plot => sur mobaxterm 
# xmgrace -nxy energy.xvg
# wait
gmx energy -f md_prod.edr -o temperature.xvg ## 16 \n \n 
wait
gmx energy -f md_prod.edr -o pression.xvg ## 18 \n \n 
wait
gmx rms -f md_prod.xtc -s md_prod.tpr -o rmsd.xvg ## 3 \n 3\n : Ecart moyen entre les C alpha simu et la molécule de départ => permet de voir si on a bien bougé 
wait
gmx gyrate -f md_prod.xtc -s md_prod.tpr -o rgyr.xvg ## 2 \n : Compacité (forme globale) => est ce que la forme globale de ma protéine a changer 
wait
## -res = affichage en fct des résidus
gmx rmsf -f md_prod.xtc -s md_prod.tpr -o rmsf.xvg -res ## 3 \n : Est ce que les atomes fluctuent par rapport a la valeur de départ = equivalent au b factor 
wait
gmx do_dssp -f md_prod.xtc -s md_prod.tpr -o ss -tu ns ## 1 \n 
wait
gmx xpm2ps -f ss.xpm -o ss.eps -by 7 -bx 0.5 ## Transformation du fichier en eps => cartographie des structure secondaires
# ps2pdf ss.eps ## Pour tarnsformer eps to pdf 
wait
gmx hbond -f md_prod.xtc -s md_prod.tpr -n index.ndx ## 1 \n 1\n 
wait

mkdir chi 
cp md_prod.xtc chi 
cp md_prod.tpr chi 
cd chi
gmx chi -f md_prod.xtc -s md_prod.tpr -rama -maxchi 2 ## Evolution du chi 
