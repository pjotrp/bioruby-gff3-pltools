module Bio
  module PL
    module GFF3
      # Runs the gff3-ffetch utility with the specified parameters on
      # an external file. Options include :output, :at_most,
      # :keep_fasta, :keep_comments, :keep_pragmas, :gtf_output,
      # :json_output, :select
      def self.filter_file filename, filter_string, options = {}
        if !File.exists?(filename)
          raise Exception.new("No such file - #{filename}")
        end

        output_option = nil
        output = nil
        if !options[:output].nil?
          output_option = "--output #{options[:output]}"
        end
        if !options[:at_most].nil?
          at_most_option = "--at-most #{options[:at_most]}"
        end
        if options[:keep_fasta]
          fasta_option = "--keep-fasta"
        end
        if options[:keep_comments]
          comments_option = "--keep-comments"
        end
        if options[:keep_pragmas]
          pragmas_option = "--keep-pragmas"
        end
        if options[:gtf_output]
          gtf_output_option = "--gtf-output"
        end
        if options[:json_output]
          json_output_option = "--json"
        end
        if !options[:select].nil?
          select_option = "--select \"#{options[:select]}\""
        end
        puts "gff3-ffetch --filter \"#{filter_string}\" #{filename} #{output_option} #{at_most_option} #{fasta_option} #{comments_option} #{pragmas_option} #{gtf_output_option} #{json_output_option} #{select_option}"
        gff3_ffetch = IO.popen("gff3-ffetch --filter \"#{filter_string}\" #{filename} #{output_option} #{at_most_option} #{fasta_option} #{comments_option} #{pragmas_option} #{gtf_output_option} #{json_output_option} #{select_option}")
        if output_option.nil?
          output = gff3_ffetch.read
        end
        gff3_ffetch.close
        output
      end

      # Runs the gff3-ffetch utility with the specified parameters while
      # passing data to its stdin. Options include :output and :at_most,
      # :keep_fasta, :keep_comments, :keep_pragmas, :gtf_output,
      # :json_output, :select
      def self.filter_data data, filter_string, options = {}
        output_option = nil
        output = nil
        if !options[:output].nil?
          output_option = "--output #{options[:output]}"
        end
        if !options[:at_most].nil?
          at_most_option = "--at-most #{options[:at_most]}"
        end
        if options[:keep_fasta]
          fasta_option = "--keep-fasta"
        end
        if options[:keep_comments]
          comments_option = "--keep-comments"
        end
        if options[:keep_pragmas]
          pragmas_option = "--keep-pragmas"
        end
        if options[:gtf_output]
          gtf_output_option = "--gtf-output"
        end
        if options[:json_output]
          json_output_option = "--json"
        end
        if !options[:select].nil?
          select_option = "--select \"#{options[:select]}\""
        end
        gff3_ffetch = IO.popen("gff3-ffetch --filter \"#{filter_string}\" - #{output_option} #{at_most_option} #{fasta_option} #{comments_option} #{pragmas_option} #{gtf_output_option} #{json_output_option} #{select_option}", "r+")
        gff3_ffetch.write data
        gff3_ffetch.close_write
        if output_option.nil?
          output = gff3_ffetch.read
        end
        gff3_ffetch.close
        output
      end
    end

    module GTF
      # Runs the gtf-ffetch utility with the specified parameters on
      # an external file. Options include :output, :at_most,
      # :keep_fasta, :keep_comments, :keep_pragmas, :gff3_output,
      # :json_output, :select
      def self.filter_file filename, filter_string, options = {}
        if !File.exists?(filename)
          raise Exception.new("No such file - #{filename}")
        end

        output_option = nil
        output = nil
        if !options[:output].nil?
          output_option = "--output #{options[:output]}"
        end
        if !options[:at_most].nil?
          at_most_option = "--at-most #{options[:at_most]}"
        end
        if options[:keep_fasta]
          fasta_option = "--keep-fasta"
        end
        if options[:keep_comments]
          comments_option = "--keep-comments"
        end
        if options[:keep_pragmas]
          pragmas_option = "--keep-pragmas"
        end
        if options[:gff3_output]
          gff3_output_option = "--gff3-output"
        end
        if options[:json_output]
          json_output_option = "--json"
        end
        if !options[:select].nil?
          select_option = "--select \"#{options[:select]}\""
        end
        gff3_ffetch = IO.popen("gtf-ffetch --filter \"#{filter_string}\" #{filename} #{output_option} #{at_most_option} #{fasta_option} #{comments_option} #{pragmas_option} #{gff3_output_option} #{json_output_option} #{select_option}")
        if output_option.nil?
          output = gtf_ffetch.read
        end
        gtf_ffetch.close
        output
      end

      # Runs the gtf-ffetch utility with the specified parameters while
      # passing data to its stdin. Options include :output and :at_most,
      # :keep_fasta, :keep_comments, :keep_pragmas, :gff3_output,
      # :json_output, :select
      def self.filter_data data, filter_string, options = {}
        output_option = nil
        output = nil
        if !options[:output].nil?
          output_option = "--output #{options[:output]}"
        end
        if !options[:at_most].nil?
          at_most_option = "--at-most #{options[:at_most]}"
        end
        if options[:keep_fasta]
          fasta_option = "--keep-fasta"
        end
        if options[:keep_comments]
          comments_option = "--keep-comments"
        end
        if options[:keep_pragmas]
          pragmas_option = "--keep-pragmas"
        end
        if options[:gff3_output]
          gff3_output_option = "--gff3-output"
        end
        if options[:json_output]
          json_output_option = "--json"
        end
        if !options[:select].nil?
          select_option = "--select \"#{options[:select]}\""
        end
        gtf_ffetch = IO.popen("gtf-ffetch --filter \"#{filter_string}\" - #{output_option} #{at_most_option} #{fasta_option} #{comments_option} #{pragmas_option} #{gff3_output_option} #{json_output_option} #{select_option}", "r+")
        gtf_ffetch.write data
        gtf_ffetch.close_write
        if output_option.nil?
          output = gtf_ffetch.read
        end
        gtf_ffetch.close
        output
      end
    end
  end
end

