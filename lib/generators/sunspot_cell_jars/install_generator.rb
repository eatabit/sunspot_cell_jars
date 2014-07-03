module SunspotCellJars
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      def install_sunspot_cell_jars
        if File.exists?('solr')

          Dir.mkdir("solr/lib") unless File.exists?("solr/lib")

          files = %w{
            pdfbox-1.7.1.jar
            apache-mime4j-core-0.7.2.jar  
            poi-3.8.jar
            apache-mime4j-dom-0.7.2.jar   
            poi-ooxml-3.8.jar
            bcmail-jdk15-1.45.jar         
            poi-ooxml-schemas-3.8.jar
            bcprov-jdk15-1.45.jar         
            poi-scratchpad-3.8.jar
            boilerpipe-1.1.0.jar          
            rome-0.9.jar
            commons-compress-1.4.1.jar    
            solr-cell-4.2.0.jar
            dom4j-1.6.1.jar               
            tagsoup-1.2.1.jar
            fontbox-1.7.1.jar             
            tika-core-1.3.jar
            icu4j-49.1.jar                
            tika-parsers-1.3.jar
            isoparser-1.0-RC-1.jar        
            vorbis-java-core-0.1.jar
            jdom-1.0.jar                  
            vorbis-java-tika-0.1.jar
            jempbox-1.7.1.jar             
            xercesImpl-2.9.1.jar
            juniversalchardet-1.0.3.jar   
            xmlbeans-2.3.0.jar
            metadata-extractor-2.6.2.jar  
            xz-1.0.jar
            netcdf-4.2-min.jar
          }

          files.each do |file|
            copy_file file, "solr/lib/#{file}"
          end
        else
          say "You need to have a solr directory created in your rails root before I can proceed"
        end
      end
    end
  end
end
