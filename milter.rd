= milter

Sendmailが作ったメールフィルタ（Mail fILTER）のきまり。

詳細は((<milter.org|URL:https://www.milter.org/developers>))を参照。

== 豆知識

=== ソケットの種類による速度に違い

inetよりもunixの方が10倍程度は速い。（手元のDebian GNU/Linux環境で((*簡単に*))試した場合）

((<Postfix>))付属のtest-milterに対して((<milter-manager>))のmilter-test-serverで接続して実験した結果。

milter-test-serverはmilterプロトコルを話すので、SMTPの影響はない。

test-milterのビルド:
  % sudo aptitude -V -r -D install libmilter-dev
  % cd postfix/src/milter
  % cc -o test-milter{,.c} -L/usr/lib/libmilter -lmilter

実験用スクリプト（statistics.rb）:
  # enscript: ruby

  #!/usr/bin/env ruby

  require 'shellwords'

  n_repeat, *command = ARGV

  escaped_command = Shellwords.shelljoin(command)
  elapsed_times = []
  Integer(n_repeat).times do |i|
    if /(\d+\.\d+)/ =~ `#{escaped_command}`
      elapsed_times << $1.to_f
    end
  end

  total = elapsed_times.inject(0) do |result, time|
    result + time
  end
  puts "min: #{elapsed_times.min}"
  puts "max: #{elapsed_times.max}"
  puts "ave: #{total / elapsed_times.size}"

実験は、10回test-milterに接続して、かかった時間の最小値、最大値、平均値をみる。

unix:
  [term1]% ./test-milter -p unix:/tmp/test-milter.sock
  [term2]% ruby statistics.rb 10 tool/milter-test-server -s unix:/tmp/test-milter.sock
  min: 0.00487834
  max: 0.0239799
  ave: 0.012895964

inet:
  [term1]% ./test-milter -p inet:10025
  [term2]% ruby statistics.rb 10 tool/milter-test-server -s inet:10025
  min: 0.157722
  max: 0.192172
  ave: 0.1659868

この簡単な実験では、上記のようにunixの方がinetよりも速い。最小値だと約30倍速く、平均値でも約10倍速い。

注意: Sendmailのlibmilterのunixの実装がinetの実装よりも速い可能性とmilter-managerのmilter-test-serverのunixの実装がinetの実装よりも速い可能性がある。ただ、Sendmailのlibmilterもmilter-managerのmilter-test-serverもunixだからといって特別なことをしているわけではないので、単純にIPv4のソケットよりもUNIXドメインソケットの方が速いという気がする。
