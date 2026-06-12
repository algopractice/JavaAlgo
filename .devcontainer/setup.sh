#!/bin/bash
# ===================================================================================
# SETUP SCRIPT: JUPYTER JAVA CODESPACE ENVIRONMENT (Ubuntu 24.04 Native Paths)
# ===================================================================================

set -e

# Suppress the root pip warning from cluttering your installation logs
export PIP_ROOT_USER_ACTION=ignore

echo "================================================================="
echo "🚀 INITIALIZING NATIVE JAVA JUPYTERLAB ENVIRONMENT"
echo "================================================================="

# -----------------------------------------------------------------------------------
# PHASE 1: SYSTEM INFRASTRUCTURE
# -----------------------------------------------------------------------------------
echo "📦 [PHASE 1/4] Configuring package manager binaries..."
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip curl

# -----------------------------------------------------------------------------------
# PHASE 2: APPLICATION SERVER LAYER (JupyterLab Platform)
# -----------------------------------------------------------------------------------
echo "🌐 [PHASE 2/4] Deploying core Jupyter infrastructure packages..."
sudo python3 -m pip install jupyterlab notebook ipykernel --break-system-packages --ignore-installed

# -----------------------------------------------------------------------------------
# PHASE 3: DEPENDENCY MANAGEMENT ENGINE (JBang Infrastructure)
# -----------------------------------------------------------------------------------
echo "⚙️ [PHASE 3/4] Registering local JBang system runner binaries..."
curl -Ls https://sh.jbang.dev | bash -s - app setup
export PATH="$HOME/.jbang/bin:$PATH"

# -----------------------------------------------------------------------------------
# PHASE 4: KERNEL ROUTING & ALIGNMENT
# -----------------------------------------------------------------------------------
echo "☕ [PHASE 4/4] Activating the verified Jupyter Java Kernel targets..."

# Fix: Wrap the wildcard in quotes so bash doesn't expand it into local filenames
jbang trust add '*'
jbang trust add "https://github.com"

# Force absolute execution trust policy directly via the flag argument parameter
jbang install-kernel@jupyter-java

mkdir -p ~/.local/share/jupyter/kernels
ln -sf ~/.jbang/cache/jupyter/kernels/jjava ~/.local/share/jupyter/kernels/jjava


echo "================================================================="
echo "✅ INFRASTRUCTURE READY! OPEN REPO IN JUPYTERLAB TO START DSA"
echo "================================================================="
