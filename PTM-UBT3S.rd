= PTM-UBT3S

Debian GNU/Linux��USB��³��Bluetooth�����ץ�PTM-UBT3S��Ȥä�Audio Sink���ꤿ����
���ɡ��ޤ�̵���Ȥ����á�

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
