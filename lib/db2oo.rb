require "db2oo/version"
require "ibm_db"

class DB2OO
  def self.connect *args
    obj = self.new
    obj.instance_variable_set "@db", IBM_DB::connect(*args)
    obj
  end
  
  def execute sql
    @stat = IBM_DB::exec @db, sql
  end
  
  def fetch_all
    dd=[]
    while x=IBM_DB::fetch_array(@stat)
      dd<<x
    end
    dd
  end
  
  def close
    IBM_DB::close @db
  end
end
