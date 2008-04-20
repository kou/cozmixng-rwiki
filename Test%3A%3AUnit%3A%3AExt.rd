= Test::Unit::Ext

Test::Unit���ĥ���롥

((<RubyForge�˰�ư|URL:http://test-unit-ext.rubyforge.org/>))������


== ^C-c�ǻߤ�Ƥ��̤�ɽ��

�ǿ��Ǥ�((<���ä�|URL:http://www.cozmixng.org/repos/rwiki/trunk/test/test-unit-ext/always-show-result.rb>))

  # enscript ruby
  require "test/unit/ui/testrunnermediator"

  module Test
    module Unit
      module UI
        class TestRunnerMediator
          alias_method :original_run_suite, :run_suite
          def run_suite
            @notified_finished = false
            begin_time = Time.now
            original_run_suite
          rescue Interrupt
            unless @notified_finished
              end_time = Time.now
              elapsed_time = end_time - begin_time
              notify_listeners(FINISHED, elapsed_time)
            end
            raise
          end

          def notify_listeners(channel_name, *arguments)
            @notified_finished = true if channel_name == FINISHED
            super
          end
        end
      end
    end
  end

== �ƥ��Ȥ�ͥ���٤�Ĥ���

�ǿ��Ǥ�((<���ä�|URL:http://www.cozmixng.org/repos/rwiki/trunk/test/test-unit-ext/priority.rb>))

  # enscript ruby
  require "test/unit"

  require "fileutils"

  module Test
    module Unit
      class TestCase
        class << self
          def inherited(sub)
            super
            sub.instance_variable_set("@priority_initialized", true)
            sub.instance_variable_set("@priority_table", {})
            sub.priority :normal
          end

          def include(*args)
            args.reverse_each do |mod|
              super(mod)
              next unless defined?(@priority_initialized)
              mod.instance_methods(false).each do |name|
                set_priority(name)
              end
            end
          end

          def method_added(name)
            set_priority(name) if defined?(@priority_initialized)
          end

          def priority(name, *tests)
            unless private_methods.include?(priority_check_method_name(name))
              raise ArgumentError, "unknown priority: #{name}"
            end
            if tests.empty?
              @current_priority = name
            else
              tests.each do |test|
                set_priority(test, name)
              end
            end
          end

          def need_to_run?(test_name)
            normalized_test_name = normalize_test_name(test_name)
            priority = @priority_table[normalized_test_name]
            return true unless priority
            __send__(priority_check_method_name(priority), test_name)
          end

          private
          def priority_check_method_name(priority_name)
            "run_priority_#{priority_name}?"
          end

          def normalize_test_name(test_name)
            "test_#{test_name.to_s.sub(/^test_/, '')}"
          end

          def set_priority(name, priority=@current_priority)
            @priority_table[normalize_test_name(name)] = priority
          end

          def run_priority_must?(test_name)
            true
          end

          def run_priority_important?(test_name)
            rand > 0.1
          end

          def run_priority_high?(test_name)
            rand > 0.3
          end

          def run_priority_normal?(test_name)
            rand > 0.5
          end

          def run_priority_low?(test_name)
            rand > 0.75
          end
        end

        def need_to_run?
          !previous_test_success? or self.class.need_to_run?(@method_name)
        end

        alias_method :original_run, :run
        def run(result, &block)
          original_run(result, &block)
        ensure
          if passed?
            FileUtils.rm_f(not_passed_file)
          else
            FileUtils.touch(not_passed_file)
          end
        end

        private
        def previous_test_success?
          not File.exist?(not_passed_file)
        end

        def result_dir
          dir = File.join(File.dirname($0), ".test-result",
                          self.class.name, @method_name)
          dir = File.expand_path(dir)
          FileUtils.mkdir_p(dir)
          dir
        end

        def not_passed_file
          File.join(result_dir, "not-passed")
        end
      end

      class TestSuite
        @@priority_mode = false

        class << self
          def priority_mode=(bool)
            @@priority_mode = bool
          end
        end

        alias_method :original_run, :run
        def run(*args, &block)
          priority_mode = @@priority_mode
          if priority_mode
            @original_tests = @tests
            apply_priority
          end
          original_run(*args, &block)
        ensure
          @tests = @original_tests if priority_mode
        end

        def apply_priority
          @tests = @tests.reject {|test| !test.need_to_run?}
        end

        def need_to_run?
          apply_priority
          !@tests.empty?
        end
      end

      class AutoRunner
        alias_method :original_options, :options
        def options
          opts = original_options
          opts.on("--[no-]priority", "use priority mode") do |bool|
            TestSuite.priority_mode = bool
          end
          opts
        end
      end
    end
  end

�Ȥ������Ϥ���ʴ���

  # enscript ruby
  class SomeTest < Test::Unit::TestCase
    priority :must
    def test_ɬ���¹Ԥ����ƥ���
      ...
    end

    ...

    priority :important
    def test_�ۤȤ�ɤξ��¹Ԥ����ƥ���
      ...
    end

    ...

    priority :high
    def test_���������ξ��¹Ԥ����ƥ���
      ...
    end

    ...

    priority :normal
    def test_Ⱦʬ���餤�ϼ¹Ԥ����ƥ���
      ...
    end

    ...

    priority :low
    def test_���ޤ˼¹Ԥ����ƥ���
      ...
    end

    ...
  end


�ƥ��Ȥ�ͥ���٤��Ѥ������Ȥ��ϡ��ƥ��ȥ᥽�åɤ�������ư��
���������ͥ���٤��⤤�ƥ��Ȥۤɥե��������Ƭ������������ơ�
�褯�ܤ��դ��褦�ˤ���Τ��ߥ���

���: ((*--priority���ץ������դ��ʤ���ͥ���٤Ϲ�θ���ޤ���*))
