#!/bin/bash
# ===================================================================================
# SETUP SCRIPT: JUPYTER JAVA CODESPACE ENVIRONMENT (Ubuntu 24.04 Compatible)
# ===================================================================================

set -e

echo "================================================================="
echo "🚀 INITIALIZING NATIVE JAVA JUPYTERLAB ENVIRONMENT"
echo "================================================================="

# -----------------------------------------------------------------------------------
# PHASE 1: SYSTEM INFRASTRUCTURE (Ubuntu Core Layer)
# Purpose: Update package tracking paths and pull the standard system python components.
# -----------------------------------------------------------------------------------
echo "📦 [PHASE 1/4] Configuring package manager binaries..."
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip curl

# -----------------------------------------------------------------------------------
# PHASE 2: APPLICATION SERVER LAYER (JupyterLab Platform)
# Purpose: Direct installation of notebook systems using the native platform package instance.
#          Bypasses internal pip configuration rewrites by forcing system acceptance.
# -----------------------------------------------------------------------------------
echo "🌐 [PHASE 2/4] Deploying core Jupyter infrastructure packages..."
sudo python3 -m pip install jupyterlab notebook ipykernel --break-system-packages --ignore-installed

# -----------------------------------------------------------------------------------
# PHASE 3: DEPENDENCY MANAGEMENT ENGINE (JBang Infrastructure)
# Purpose: Provision the JBang scripting runtime layer to cache modern Java compiler targets.
# -----------------------------------------------------------------------------------
echo "⚙️ [PHASE 3/4] Registering local JBang system runner binaries..."
curl -Ls https://sh.jbang.dev | bash -s - app setup
export PATH="$HOME/.jbang/bin:$PATH"

# -----------------------------------------------------------------------------------
# PHASE 4: KERNEL ROUTING & ALIGNMENT (Jupyter Core Alignment)
# Purpose: Bind the compiled Java notebook kernel mapping files directly into global scope.
# -----------------------------------------------------------------------------------
echo "☕ [PHASE 4/4] Activating the verified Jupyter Java Kernel targets..."
jbang trust add https://github.com
jbang install-kernel@jupyter-java

mkdir -p ~/.local/share/jupyter/kernels
ln -sf ~/.jbang/cache/jupyter/kernels/jjava ~/.local/share/jupyter/kernels/jjava

echo "================================================================="
echo "✅ INFRASTRUCTURE READY! OPEN REPO IN JUPYTERLAB TO START DSA"
echo "================================================================="