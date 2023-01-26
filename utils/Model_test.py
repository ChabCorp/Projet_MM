# new script Modeller python
# mod9v11 xxxxx.py &
# modelisation automatique + les boucles
#refine par md_slow

from modeller import *
from modeller.automodel import *
log.verbose()

env = environ()
# ne pas faire differents modeles de boucles, juste une modelisation avec une boucle
#a = automodel(env, alnfile='Align_test.pir',
#              knowns='2D9X_A_M', sequence='fapp1_mod1',
#              assess_methods=(assess.DOPE, assess.GA341))
#a.starting_model = 1
#a.ending_model = 1
#a.make()

# faire en plus des modeles de boucles
a = dope_loopmodel(env, alnfile='Align.pir',
              knowns='4r7l', sequence='4R7L_mod',
              assess_methods=(assess.DOPE, assess.GA341))
a.starting_model = 1
a.ending_model = 10

a.md_level=refine.slow

a.loop.starting_model=1
a.loop.ending_model=10
a.loop.md_level=refine.slow

a.make()

