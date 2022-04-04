!/bin/bash

nums=$(seq 0 9)
states=('Nebraska' 'California' 'Texas' 'Hawaii' 'Washington' 'New York')

for state in ${states[@]};
do
if [ $state == 'Hawaii' ];
then
echo "Hawaii is the best!"
else
echo "I'm not a fan of Hawaii."
fi
done