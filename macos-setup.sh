# 2020 Python workspace on MacOS Catalina
# Author: Patrick Rodrigues <patrick.pwall@gmail.com>

PY38=3.8.2
PY37=3.7.7
PYTOOLS="poetry pipenv ipython notebook black pre-commit git-flow-wrapper"

WORKDIR=~/workspace

# Install dependencies
brew install openssl readline zlib

# Install Pyenv
brew install pyenv

# All my projects are here...
mkdir -p $WORKDIR

# Pyenv initialization
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc

# Install Python versions
pyenv install $PY38
pyenv install $PY37

# Upgrade pip
~/.pyenv/versions/$PY38/bin/pip install --upgrade pip
~/.pyenv/versions/$PY37/bin/pip install --upgrade pip


# Install Python Tools
# https://pipxproject.github.io/pipx/
~/.pyenv/versions/$PY38/bin/python -m pip install --user pipx
~/.pyenv/versions/$PY38/bin/python -m pipx ensurepath
~/.pyenv/versions/$PY38/bin/python -m pipx install $PYTOOLS

# Setup path order
pyenv global $PY38 $PY37

# Check everything
pyenv which python     | grep -q "$PY38" && echo "✓ $PY38"
pyenv which python3.7  | grep -q "$PY37" && echo "✓ $PY37"

pipx list | grep -q "ipython" && echo "✓ ipython"
pipx list | grep -q "poetry" && echo "✓ poetry"
pipx list | grep -q "pipenv" && echo "✓ pipenv"
pipx list | grep -q "ipython" && echo "✓ ipython"
pipx list | grep -q "notebook" && echo "✓ notebook"
pipx list | grep -q "black" && echo "✓ black"
pipx list | grep -q "pre-commit" && echo "✓ pre-commit"
pipx list | grep -q "git-flow-wrapper" && echo "✓ git-flow-wrapper"

echo "Done! Restart the terminal."