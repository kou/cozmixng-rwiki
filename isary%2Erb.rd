= isary.rb

Interactive Sary

((<SDIC|URL:http://www.namazu.org/~tsuchiya/sdic/>))で((<SUFARY|URL:http://nais.to/~yto/tools/sufary/>))じゃなくて((<Sary|URL:http://sary.namazu.org/>))を使うための対話的にSaryを使うプログラム．

ようはSUFARYのarrayのSary版(コマンドはSDICで使う物のみ実装)．

で，これをsdic.elで使うには

  (1) 実行権を付ける
  (2) PATHが通っているところに置く
  (3) .emacsなどに以下を追加

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
