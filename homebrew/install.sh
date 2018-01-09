# Check for Homebrew,Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
printf "Update recipes? [Y/n]: " && read ANS
if [ "${ANS}" = "Y" ]; then
    brew update
fi

# Upgrade all
printf "Upgrade? [Y/n]: " && read ANS
if [ "${ANS}" = "Y" ]; then
    brew upgrade
fi

# Add Repository
brew tap homebrew/dupes
brew tap homebrew/versions   
brew tap homebrew/binary     
brew tap thoughtbot/formulae
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap xoebus/homebrew-cloudfoundry


packages=(

    # GNU core utilities (those that come with OS X are outdated)
    coreutils

    # GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
    findutils

    # recent versions of some OS X tools
    homebrew/dupes/grep
    #apple-gcc42
    
    # Shell
    zsh
    bash


    # Multiplexe
    tmux
    reattach-to-user-namespace 

    # Git
    git   
    hub   
    gitsh 
    gist  
    tig

    # Image
    imagemagick 

    # Utils
    autoconf
    proctools 
    automake  
    rmtrash       
    wget      
    curl          
    tree      
    openssl   
    libyaml   
    readline  
    markdown  
    nkf       
    ag
    direnv

    # Languages
    rbenv            
    ruby-build       
    go               
    python3
    ghc
    scala      

    #Database
    mysql
    postgres    

    #CF
    spiff      

    #Java
    jenv
)

echo "installing binaries..."
brew install ${packages[@]} && brew cleanup

# Casks
brew cask

# Apps
apps=(

    # Launcher
    alfred

    # Browser
    google-chrome

    # Terminal
    iterm2
    
    # Communication
    slack
    skype

    # VM    
    virtualbox
    vagrant
    vagrant-manager

    # etc ...
    google-backup-and-sync
    flux
)

# Install apps to /Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# We need to link it
brew cask alfred link



# fonts
fonts=(
    font-m-plus
    font-source-code-pro
    font-clear-sans
    font-roboto
    font-fontawesome
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}


echo  "Installaling Java"
brew cask install java



