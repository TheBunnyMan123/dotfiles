# If it's an interactive shell, run bashrc
if [ -f $HOME/.bashrc ]
then
  if [[ $- == *i* ]]
  then
    source $HOME/.bashrc
  fi
fi