= isary.rb

Interactive Sary

((<SDIC|URL:http://www.namazu.org/~tsuchiya/sdic/>))��((<SUFARY|URL:http://nais.to/~yto/tools/sufary/>))����ʤ���((<Sary|URL:http://sary.namazu.org/>))��Ȥ����������Ū��Sary��Ȥ��ץ���ࡥ

�褦��SUFARY��array��Sary��(���ޥ�ɤ�SDIC�ǻȤ�ʪ�Τ߼���)��

�ǡ������sdic.el�ǻȤ��ˤ�

  (1) �¹Ը����դ���
  (2) PATH���̤äƤ���Ȥ�����֤�
  (3) .emacs�ʤɤ˰ʲ����ɲ�

        (add-hook 'sdic-mode-hook
                  '(lambda ()
                     (setq sdicf-array-command
                           (sdicf-find-program "array" "array.exe" "isary.rb"))

  #!/usr/bin/env ruby

  require "sary"

  class SaryIntep

    def initialize(filename)
      @saryer = Sary::Searcher.new(filename)
      @saryer.enable_cache
      init_variables
    end

    def start(input, output)
      @output = output
      puts "ok"
      input.each do |line|
        case line.strip
        when /\A\s*search\s+(.+)\s*\z/
          search_word($1)
        when /\A\s*init\s*\z/
          init_current_state
        when /\A\s*show\s*\z/
          show_result
        when /\A\s*quit\s*\z/
          puts "bye."
          return
        when /\A\s*style\s+(index|simple|kwic|line)\s*\z/
          set_style($1)
        when /\A\s*order\s+(index|alphabetical)\s*\z/
          set_order($1)
        else
          puts "bad command."
        end
      end
    end

    private
    def puts(*args)
      @output.puts(*args)
    end

    def set_style(style)
      @style = style
      puts "ok"
    end

    def set_order(order)
      @order = order
      puts "ok"
    end

    def init_variables
      @style = "line"
      @order = "index"
    end

    def search_word(word)
      if @saryer.search(word)
        @saryer.sort_occurrences if @order == "index"
        puts "FOUND:#{@saryer.count_occurrences}"
      else
        puts "no matching elements."
      end
      puts "ok"
    end

    def init_current_state
      puts "ok"
    end

    def show_result
      from = 1
      to = @saryer.count_occurrences
      max = @saryer.count_occurrences
      puts "from #{from} to #{to} (#{max})"
  #   case @style
  #   when "line"
        @saryer.each_context_line do |line|
          puts line
        end
  #   end
      puts "ok"
    end

  end

  SaryIntep.new(ARGV.shift).start(STDIN, STDOUT)
