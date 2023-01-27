# new script Modeller python
# mod9v11 xxxxx.py &
# modelisation automatique + les boucles
#refine par md_slow

from modeller import *
from modeller.automodel import *
log.verbose()

env = environ()

# faire en plus des modeles de boucles
a = dope_loopmodel(env, alnfile='Align.pir',
              knowns='4r7l', sequence='4r7l_mod',
              assess_methods=(assess.DOPE, assess.GA341))
# j = Job()
# for _ in range(12) : 
#      j.append(local_slave())
# a.use_parallel_job(j)

a.starting_model = 1
a.ending_model = 30

a.md_level=refine.slow

a.loop.starting_model=1
a.loop.ending_model=10
a.loop.md_level=refine.slow

a.make()

