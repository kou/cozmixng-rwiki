= ���ȥ꡼�ߥ�

���ȥ꡼�ߥ󥰴ط��κ�ȵ�Ͽ�Ǥ���

((<���åץ� - QuickTime Streaming Server - FAQ|URL:http://www.apple.co.jp/quicktime/products/qtss/qtssfaq.html>))

== Darwin Streaming Server

=== ���󥹥ȡ���

  (1) ((<URL:http://developer.apple.com/darwin/projects/streaming/>))���DSS-4_1_3.src.tar.gz���������ɡ�

      * ��������ɤ������˥桼����Ͽ��ɬ�ס�
      * �桼����Ͽ�򤹤��CVS�Ǥ⥽������������ǽ��
      * ����ϤȤꤢ����tar ball�ǡ�

  (2) Ÿ�������ǥ��쥯�ȥ�ǰʲ���¹ԡ�

  % ./Buildit
  % ./DSS_MakeRoot -f ../DSS-4_1_3.bin
  % cd ../DSS-4_1_3.bin
  # ./Install

==== ��ư

  # DarwinStreamingServer
  # streamingadminserver.pl

=== ports�ǥ��󥹥ȡ���

  % sudo /usr/local/sbin/portupgrade -N DarwinStreamingServer

==== ����

/etc/rc.conf�˰ʲ��򵭽�

  darwin_streaming_server_enable="YES"
  darwin_streaming_server_flags=""

  streamingadminserver_enable="YES"
  streamingadminserver_flags=""

�����ԤΥѥ���ɤ�����

  # qtpasswd -c $Username$
  # echo admin: $Username$ > /usr/local/etc/streaming/qtgroups

SSL�θ�������

  % cd /usr/local/etc/streaming
  % sudo openssl genrsa -rand streamingadminserver.key -des3 -out streamingadminserver.key 1024
  % sudo openssl rsa -in streamingadminserver.key -out streamingadminserver.key
  % sudo /usr/local/openssl/misc/CA.sh -newca
  % sudo openssl req -new -days 365 -key streamingadminserver.key -out csr.pem
  % sudo openssl ca -in csr.pem -keyfile demoCA/private/cakey.pem -cert demoCA/cacert.pem -out streamingadminserver.pem
  % sudo chmod 600 streamingadminserver.key

=== streamingadminserver.pl

�����((<URL:https://streaming.cozmixng.org:1240/>))�Ǵ������̤˹Ԥ����Ȥ��Ǥ��롣�ǥե���ȤǤϤɤ��������³�Ǥ������Ǥ��롩

==== �ץ쥤�ꥹ��

�������̤���ץ쥤�ꥹ�Ȥ��ä���ƥץ쥤�ꥹ�Ȥα�¦�ˤ��뻰�Ѥγ�(�����ܥ���)�򲡤��ƺ��������ʤ��ȥ��ᡣ

=== ��³

MP3�˥�����������Ȥ���HTTP��80�֤�8000�֥ݡ��ȡ�MPEG4��QuickTime�˥�����������Ȥ���RTSP��Ȥ��ߤ������긵�Ǥ�mplayer��MP3��ʹ��������MPEG4��QuickTime��̵�������ʤߤ˥������MPEG4��QuickTime�ϸ���롣

MP3��ʹ�������Ȥ���
  % mplayer http://streaming.cozmixng.org/sample_mp3
or
  % mpg123 http://streaming.cozmixng.org/sample_mp3

�ʲ�̤��ǧ��QuickTime Player on Mac�Ǥγ�ǧ���ࡣ

MPEG4�򸫤����Ȥ���
  % mplayer rtsp://streaming.cozmixng.org/sample_300kbit.mp4
QuickTime�򸫤����Ȥ���
  % mplayer rtsp://streaming.cozmixng.org/sample_300kbit.mov
SDP�Ǹ������Ȥ���
  % mplayer -sdp rtsp://streaming.cozmixng.org/sample_movie.sdp

=== how to use? - ((<szk>))

  * MPEG4, QuickTime, SDP ��������ʹ���ޤ�����by MacOSX Quicktime Player6.02 - ((<szk>))

  * RealOne Player �Υȥ饤������ for Mac OS X ((<URL:http://www.real.com/realone/mac/index.html>))�򤿤ᤷ�ޤ������ȥ饤����Ǥ� mp3 ������������ʤ褦�Ǥ��� - ((<szk>))

  * Windows Media Player7 on Windows 2000��MP3��ʹ���뤳�Ȥ��ǧ - ((<kou>))

  * QuickTime Player 6 on Windows 2000��MPEG4��QuickTime�ϲ����⸫��Ʋ���ʹ���뤳�Ȥ��ǧ����������SDP���Ȳ�����ʹ���ʤ��������ϸ���ʤ��� - ((<kou>))
