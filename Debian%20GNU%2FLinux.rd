= Debian GNU/Linux

Debian GNU/Linux�ط��κ�ȵ�Ͽ

== wheel���롼�װʳ�su����ʤ��褦�ˤ���

/etc/pam.d/su�ΰʲ��Υ����ȹԤ�ͭ���ˤ��롥

  # auth       required   pam_wheel.so group=wheel

group=wheel���ά�����gourp=root�����ꤵ�줿��ΤȤߤʤ���롥

== sshd��root�Υ��������ݤ���

/etc/ssh/sshd_config�ΰʲ��ιԤ򥳥��ȥ����Ȥ��롥�ޤ��ϡ�yes��((*no*))�ˤ��롥

  PermitRootLogin yes


== {CD,DVD}-R/RW��Ȥ�

/etc/modules�˰ʲ��򵭽�

  ide-scsi
  sg

/boot/grub/menu.lst��kernel�ιԤ�hdc=ide-scsi���ɲ�

  title Debian GNU/Linux
  root (hd0,0)
  kernel /vmlinuz root=/dev/hda1 hdc=ide-scsi
  initrd /initrd.img

�Ƶ�ư

/dev/sr0��/dev/cdrom�˥���ܥ�å���󥯤���

  % cd /dev
  % sudo ln -s sr0 cdrom

�ʲ�ɬ�פ��ä����ʤ���

/dev/scd0�Υ��롼�פ�cdrom�ˤ���

  % sudo chgrp cdrom /dev/scd0
  % sudo chmod g+rw /dev/scd0

{CD,DVD}-R/RW��Ȥ��桼����cdrom���롼�פˤ����

  % sudo adduser hoge cdrom

== NFS�ǥޥ���Ȥ���

((*portmap�򥤥󥹥ȡ��뤷�Ƥ����ʤ��Ȥ����ޤ���*))

  % sudo mount -t nfs ������̾:/hoge /fuga/hoge
