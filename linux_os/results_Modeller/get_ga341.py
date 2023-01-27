from modeller import *
from modeller.scripts import complete_pdb
env = environ()

import sys
model = sys.argv[1]

env.libs.topology.read(file='$(LIB)/top_heav.lib')
env.libs.parameters.read(file='$(LIB)/par.lib')

mdl = complete_pdb(env, model)
score = mdl.assess_ga341()
