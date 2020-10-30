require 'rubyXL'
require 'pg'
require 'date'

class AdmissionParser
    def initialize
        @sheet = nil
        @regions = []
        @cities = []
        @profile_subjects = []
        @languages = []
        @schools = {}
        @colleges = {}
        @regions = []
        @departments = []
        @managers = {}
    end

    # инициализируем Excel-книгу
    def init_worksheet(file)
        @reader = RubyXL::Parser.parse(file)
        init_all_data
    end

    # инициализируем все категории и цены
    def init_all_data
        @reader.worksheets.each_with_index {|sheet, index|
            sheet.sheet_data.rows.each_with_index {|row, index2|
                next if row.nil?
                # Области 3..18
                @regions << sheet.sheet_data[2][index2].value.to_s.strip if !sheet.sheet_data[2][index2].nil?
                
                # Населенные пункты 3..21
                @cities << sheet.sheet_data[3][index2].value.to_s.strip if !sheet.sheet_data[3][index2].nil?
                
                # Профильные предметы 3..7
                @profile_subjects << sheet.sheet_data[5][index2].value.to_s.strip if !sheet.sheet_data[5][index2].nil?
                
                # Языки обучения 3..4
                @languages << sheet.sheet_data[7][index2].value.to_s.strip if !sheet.sheet_data[7][index2].nil?

                # Школы 13..363
                if index2 > 13 and index2 < 363
                    school = sheet.sheet_data[index2][3].value.to_s.strip if !sheet.sheet_data[index2][3].nil? 
                    region = sheet.sheet_data[index2][2].value.to_s.strip if !sheet.sheet_data[index2][2].nil?    
                    @schools[school] = region
                elsif index2 > 367 and index2 < 393
                    college = sheet.sheet_data[index2][2].value.to_s.strip if !sheet.sheet_data[index2][2].nil?
                    @colleges[college] = "Караганда"
                elsif index2 > 395 and index2 < 429
                    college = sheet.sheet_data[index2][2].value.to_s.strip if !sheet.sheet_data[index2][2].nil?
                    region = sheet.sheet_data[index2][2].value.to_s.strip if !sheet.sheet_data[index2][2].nil?
                    region = region.split[0].gsub('ский', '')
                    @colleges[college] = region
                elsif index2 > 432 and index2 < 461
                    manager = sheet.sheet_data[index2][3].value.to_s.strip if !sheet.sheet_data[index2][3].nil?
                    department = sheet.sheet_data[index2][4].value.to_s.strip if !sheet.sheet_data[index2][4].nil?

                    @departments << department
                    @managers[department] = manager
                end
            }
        }
    end

    def set_cities
        @cities.each_with_index {|city, index|
            conn = PG.connect(:dbname => 'admissiondb', :user => 'postgres', :password => 'cao95records')
            conn.prepare('statement1', 'insert into cities (name, created_at, updated_at) values ($1, $2, $3)')
            conn.exec_prepared('statement1', [ city, DateTime.now, DateTime.now ])
        }
    end

    def set_regions
        @regions.each_with_index {|region, index|
            conn = PG.connect(:dbname => 'admissiondb', :user => 'postgres', :password => 'cao95records')
            conn.prepare('statement1', 'insert into regions (name, created_at, updated_at) values ($1, $2, $3)')
            conn.exec_prepared('statement1', [ region, DateTime.now, DateTime.now ])
        }
    end

    def set_subjects
        @profile_subjects.each_with_index {|subject, index|
            conn = PG.connect(:dbname => 'admissiondb', :user => 'postgres', :password => 'cao95records')
            conn.prepare('statement1', 'insert into subjects (name, created_at, updated_at) values ($1, $2, $3)')
            conn.exec_prepared('statement1', [ region, DateTime.now, DateTime.now ])
        }
    end

    def set_schools
        conn = PG.connect(:dbname => 'admissiondb', :user => 'postgres', :password => 'cao95records')
        @schools.each {|school, region|
            res = conn.exec("SELECT ID FROM regions WHERE name='" + region + "'")
            
            # conn.prepare('statement1', 'insert into schools (name, region, created_at, updated_at) values ($1, $2, $3, $4)')
            # conn.exec_prepared('statement1', [ school, region, DateTime.now, DateTime.now ])
        }
    end

    def get_price(vendor_code)
        return @prices[vendor_code] if @prices.has_key?(vendor_code)
    end

    def get_description(vendor_code)
        return @descriptions[vendor_code] if @descriptions.has_key?(vendor_code)
    end

    def get_color(vendor_code)
        return @colors[vendor_code] if @colors.has_key?(vendor_code)
    end

    def get_size(vendor_code)
        return @sizes[vendor_code] if @sizes.has_key?(vendor_code)
    end

    def get_colors
        return @colors
    end
end

parser = AdmissionParser.new
parser.init_worksheet('АНКЕТА.xlsx1 на сайт Абитуриент.xlsx')
parser.init_all_data

# parser.set_cities
# parser.set_regions
# parser.set_schools