#!/bin/bash
cd PDDL
chmod 755 popf
./popf Domain.pddl Problem_%s.pddl > Plan_%s.txt
cd ..