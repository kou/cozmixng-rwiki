= Java::������

�ƥ����ѤʤɤǺ������������ξ������Java�ǻ��Ѥ�����ˡ��

== ����

keystore�Ȥ���������Υǡ����١�������Ͽ����ɬ�פ����롣keystore�δ�����keytool�ǹԤ���

== ��Ͽ

�������((<OpenSSL>))��server.crt�Ȥ����ե�����̾�Ǻ���������ΤȤ��롣

  % keytool -import -alias local-server -file /tmp/server.crt -trustcacerts -noprompt

��-alias local-server�פϾ�ά��ǽ�Ǿ�ά�����mykey�ˤʤ롣

�¹Ԥ���ȥѥ���ɤ�ʹ�����Τ�������Ϥ��롣�ʥѥ���ɤ������

���ʤߤˡ��������~/.keystore����Ͽ����롣

== ��ǧ

�ʲ��μ¹Է�̤����-alias�ǻ��ꤷ��̾��������Ϥ���

  % keytool -list

== ����

���Ȥ�java�ε�ư���ץ����ˡ�-Djavax.net.ssl.trustStore=$HOME/.keystore�פ���ꤷ�Ƶ�ư����Ф褤��

  % java -Djavax.net.ssl.trustStore=$HOME/.keystore" ...

���������Τ����ݤʤ顢�����ƥ��keystore����Ͽ���롣

  % sudo keytool -import -alias local-server -file /tmp/server.crt -trustcacerts -noprompt -keystore /usr/lib/jvm/java-6-sun/jre/lib/security/cacerts

���ʤߤ˥����ƥ��keystore�Υѥ���ɤϥǥե���ȤǤϡ�changeit�פǡ��ե������$JAVA_HOME/jre/lib/security/cacerts�ˤ��롣

���������-D...�ϻ��ꤷ�ʤ��Ƥ��ɤ���
