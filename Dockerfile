FROM    guerra1994/qt-wasm

ADD ./* /moonlight-qt/

RUN     apt update && apt -qq install -y --no-install-recommends    \
        libegl1-mesa-dev \
        libgl1-mesa-dev \
        libopus-dev \
        libqt5svg5-dev \
        libsdl2-dev \
        libsdl2-ttf-dev \
        libssl-dev \
        libavcodec-dev \
        libva-dev \
        libvdpau-dev \
        libxkbcommon-dev \
        qt5-default \
        qt5-qmake \
        qtbase5-dev \
        qtdeclarative5-dev \
        qtquickcontrols2-5-dev \
        wayland-protocols \
        qml-module-qtquick-controls2 \
        qml-module-qtquick-layouts \
        qml-module-qtquick-window2 \
        qml-module-qtquick2 \
        ffmpeg 

WORKDIR /moonlight-qt

RUN     git submodule update --init --recursive

RUN     mkdir /moonlight-qt/build
WORKDIR /moonlight-qt/build
RUN     qmake ../moonlight-qt.pro && make release

EXPOSE  30000

WORKDIR /home

CMD     [ "emrun --no_browser --port 30000 moonlight.html" ]
