= PTM-UBT3S

Debian GNU/Linux��USB��³��Bluetooth�����ץ�PTM-UBT3S��Ȥä�P902iS��Audio Sink�ˤ�������
���ɡ��ޤ�̵���Ȥ����á�

�����㤦������ɡ�((<"HOWTO/AudioDevices"|URL:http://wiki.bluez.org/wiki/HOWTO/AudioDevices>))�⻲�ͤˤʤ뤫��͡�

== Bluetooth������

USB ID�Ϥ���ʴ�����

  % lsusb
  Bus 004 Device 006: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode)

ǧ������������ʤ��ñ��������ؤ�򥤥󥹥ȡ��뤹���ǧ�������Ϥ���

  % sudo aptitude -V -r install bluetooth bluez-firmware bluez-utils

hcidump�⤢���������

  % sudo aptitude -V -r install bluez-hcidump

hcitool�Ǽ�ʬ�ΥǥХ�����������ǧ������Ƥ��롣

  % hcitool dev
  Devices:
          hci0    00:11:22:33:44:55

== �ץ�ե����������

Bluetooth�б�ü��������ʬ�Ϥ���ʤ��Ȥ��Ǥ���衢�Ȥ������Τ��ץ�ե�����餷����
�����Audio Sink�ʲ��������ˤ��Ǥ���ȸ���������

/etc/default/bluetooth�ΰ��ֺǸ�˽񤤤Ƥ���SDPTOOL_OPTIONS��add A2SNK���ɲá�
  SDPTOOL_OPTIONS="add A2SNK"

ʣ���񤯤Ȥ��ϡ� ; �פǶ��ڤ롣
  SDPTOOL_OPTIONS="add A2SNK ; add AVRTG ; add OPUSH ; add HS"

OPUSH�ϥե����붦ͭ�ʡ��ˤ�HS�ϥϥ�ɥ��åȤ餷����

ȿ�Ǥ����뤿���bluetooth�����ӥ���Ƶ�ư��

  % sudo /etc/init.d/bluetooth stop
  % sudo /etc/init.d/bluetooth start

restart��Ȥ��ȥץ�ե���������꤬ȿ�Ǥ���ʤ��Τ���ա�

�ʲ��Ǥ�����ФƤ����餿�֤�����ס�

  % sdptool browse local
  ...
  Service Name: Audio Sink
  Service RecHandle: 0x10002
  Service Class ID List:
    "Audio Sink" (0x110b)
  Protocol Descriptor List:
    "L2CAP" (0x0100)
      PSM: 25
    "AVDTP" (0x0019)
      uint16: 0x100
  Profile Descriptor List:
    "Advanced Audio" (0x110d)
      Version: 0x0100
  ...

== ������������

Bluetooth��ͳ�ǲ�����������뤿��ˤ�bluetoothd-service-audio��Ȥ���

���ɡ�Debian��bluez-utils�ѥå�������--enable-audio�ǥ���ѥ��뤵��Ƥ��ʤ��Τ�bluetoothd-service-audio�����󥹥ȡ��뤵��ʤ������֤�Ubuntu���ȥ��󥹥ȡ��뤵��Ƥ뵤�����롣��ǰ�Ǥ�����

�ǤϤ���ʤΤǡ�audio/�ʲ���bluetoothd-service-audio��Ϣ����make install���Ƥ⤦������ĥ�äƤߤ������ȥ������򸫤ʤ����õ�ꡣ

=== ɬ�פʥե�����

audio/�ʲ���make install����ȥ��󥹥ȡ��뤵���ե����뤬­��ʤ�������Ū�ˤϰʲ��ΤȤ��ꡣ

  * /etc/bluetooth/audio.conf
  * /etc/bluetooth/audio.service
  * /usr/lib/bluetooth/bluetoothd-service-audio

=== ��ư��ư

/etc/bluetooth/audio.conf��Autostart���ѹ����ơ�hcid����ư�����鲻�������ӥ��ѤΥ�����bluetoothd-service-audio�ⵯư����褦�ˤ��롣

  Autostart=true

�Ƶ�ư��˺�줺�ˡ�

  % sudo /etc/init.d/bluetooth stop
  % sudo /etc/init.d/bluetooth start

�ʲ���/org/bluez/service_audio�����Ϥ��줿������ס�

  % sudo dbus-send --system --print-reply --dest=org.bluez /org/bluez org.bluez.Manager.ListServices
  method return sender=:1.106 -> dest=:1.108 reply_serial=2
     array [
        string "/org/bluez/service_audio"
     ]

== ��³����

P902iS��Bluetooth�������³�������ɬ��ǧ�ڤ򤹤�ɬ�פ�����ߤ�����

�Ȥ������Ȥǡ�options��security��auto�ˤ��ơ�passkey�򤽤�äݤ��Τˤ��롣

  options {
          ...
          security auto;
          ...
          passkey "secret";
  }

�����P902iS��Bluetooth����³����ꥹ�Ȥǥ�����������Ͽ�Ǥ���褦�ˤʤ롣

�Ǥ⡢���������ǥ����ǥ��������ӥ��ˤĤʤ����Ȥ��Ƥ⤹�����ڤ�Ƥ��ޤ�������ϡ�bluetoothd-audio-service�ˤĤʤ����Ȥ��Ƥ��ΤȤ���ǧ�ڤ˼��Ԥ��뤫�顣�ʵ������Ͽ�������hcid���Ф���ǧ�ڤ򤷤褦�Ȥ��ơ�����passkey��Ȥä�ǧ�ڤ򤹤롣��

bluetoothd-audio-service��org.bluez.Database.RequestAuthorization��ǧ�ڤ򤷤褦�Ȥ��롣�����hcid���������Ƥ���API(?)�ǡ�������Ǥϥǥե���Ȥ�ǧ�ڥ���������Ȥ�ǧ�ڤ��褦�Ȥ��롣hcid.conf��passkey��ȤäƤ���ʤ��Τ����ʴ�����

�ǥե���Ȥ�ǧ�ڥ���������Ȥϥǥե���ȤǤ����ꤵ��Ƥ��ʤ��Τ�ǧ�ڤ�ɬ�����Ԥ��롣�ǥե���Ȥ�ǧ�ڥ���������Ȥϰʲ�������Ǥ���褦�ʤ�����ɡ�XXX�ˤɤ���ͤ����ꤷ����褤�Τ��狼���

  % sudo dbus-send --system --print-reply --dest=org.bluez /org/bluez org.bluez.Security.RegisterDefaultAuthorizationAgent string:XXX

���ʤߤˡ�dbus-api.txt�ˤ�AuthorizationAgent��experimental�ߤ����ʤ��Ȥ��񤫤�Ƥ�����

�Ȥ������Ȥǡ��ޤ�������ˤ���ã���Ƥ��ޤ���Ȥ���
