require 'fileutils'
require 'sequel'

FileUtils.mkdir 'db' unless Dir.exist?('db')
begin
  DB = Sequel.connect('sqlite://db/jb.db') # requires sqlite3
  # create an items table
  DB.create_table :usererror do
    String :episode
    String :link
  end
  DB.create_table :coderradio do
    String :episode
    String :link
  end
end

# create a dataset from the items table
usererror = DB.from(:usererror)
coderradio = DB.from(:coderradio)

# User Error Table
usererror.insert(episode: '001', link: 'http://traffic.libsyn.com/usererror/ue-001.mp3')
usererror.insert(episode: '002', link: 'http://traffic.libsyn.com/usererror/ue-002.mp3')
usererror.insert(episode: '003', link: 'http://traffic.libsyn.com/usererror/ue-003.mp3')
usererror.insert(episode: '004', link: 'http://traffic.libsyn.com/usererror/ue-004.mp3')
usererror.insert(episode: '005', link: 'http://traffic.libsyn.com/usererror/ue-005.mp3')
usererror.insert(episode: '006', link: 'http://traffic.libsyn.com/usererror/ue-006.mp3')
usererror.insert(episode: '007', link: 'http://traffic.libsyn.com/usererror/ue-007.mp3')
usererror.insert(episode: '008', link: 'http://traffic.libsyn.com/usererror/ue-008.mp3')
usererror.insert(episode: '009', link: 'http://traffic.libsyn.com/usererror/ue-009.mp3')
usererror.insert(episode: '010', link: 'http://traffic.libsyn.com/usererror/ue-010.mp3')
usererror.insert(episode: '011', link: 'http://traffic.libsyn.com/usererror/ue-011.mp3')
usererror.insert(episode: '012', link: 'http://traffic.libsyn.com/usererror/ue-012.mp3')
usererror.insert(episode: '013', link: 'http://traffic.libsyn.com/usererror/ue-013.mp3')
usererror.insert(episode: '014', link: 'http://traffic.libsyn.com/usererror/ue-014.mp3')
usererror.insert(episode: '015', link: 'http://traffic.libsyn.com/usererror/ue-015.mp3')
usererror.insert(episode: '016', link: 'http://traffic.libsyn.com/usererror/ue-016.mp3')
usererror.insert(episode: '017', link: 'http://traffic.libsyn.com/usererror/ue-017.mp3')
usererror.insert(episode: '018', link: 'http://traffic.libsyn.com/usererror/ue-018.mp3')
usererror.insert(episode: '019', link: 'http://traffic.libsyn.com/usererror/ue-019.mp3')
usererror.insert(episode: '020', link: 'http://traffic.libsyn.com/usererror/ue-020.mp3')
usererror.insert(episode: '021', link: 'http://traffic.libsyn.com/usererror/ue-021.mp3')
usererror.insert(episode: '022', link: 'http://traffic.libsyn.com/usererror/ue-022.mp3')
usererror.insert(episode: '023', link: 'http://traffic.libsyn.com/usererror/ue-023.mp3')
usererror.insert(episode: '024', link: 'http://traffic.libsyn.com/usererror/ue-024.mp3')
usererror.insert(episode: '025', link: 'http://traffic.libsyn.com/usererror/ue-025.mp3')
usererror.insert(episode: '026', link: 'http://traffic.libsyn.com/usererror/ue-026.mp3')
usererror.insert(episode: '027', link: 'http://traffic.libsyn.com/usererror/ue-027.mp3')
usererror.insert(episode: '028', link: 'http://traffic.libsyn.com/usererror/ue-028.mp3')
usererror.insert(episode: '029', link: 'http://traffic.libsyn.com/usererror/ue-029.mp3')
usererror.insert(episode: '030', link: 'http://traffic.libsyn.com/usererror/ue-030.mp3')
usererror.insert(episode: '031', link: 'http://traffic.libsyn.com/usererror/ue-031.mp3')
usererror.insert(episode: '032', link: 'http://traffic.libsyn.com/usererror/ue-032.mp3')
usererror.insert(episode: '033', link: 'http://traffic.libsyn.com/usererror/ue-033.mp3')
usererror.insert(episode: '034', link: 'http://traffic.libsyn.com/usererror/ue-034.mp3')
usererror.insert(episode: '035', link: 'http://traffic.libsyn.com/usererror/ue-035.mp3')
usererror.insert(episode: '036', link: 'http://traffic.libsyn.com/usererror/ue-036.mp3')
usererror.insert(episode: '037', link: 'http://traffic.libsyn.com/usererror/ue-037.mp3')
usererror.insert(episode: '038', link: 'http://traffic.libsyn.com/usererror/ue-038.mp3')
usererror.insert(episode: '039', link: 'http://traffic.libsyn.com/usererror/ue-039.mp3')
usererror.insert(episode: '040', link: 'http://traffic.libsyn.com/usererror/ue-040.mp3')
usererror.insert(episode: '041', link: 'http://traffic.libsyn.com/usererror/ue-041.mp3')
usererror.insert(episode: '042', link: 'http://traffic.libsyn.com/usererror/ue-042.mp3')
usererror.insert(episode: '043', link: 'http://traffic.libsyn.com/usererror/ue-043.mp3')
usererror.insert(episode: '044', link: 'http://traffic.libsyn.com/usererror/ue-044.mp3')
usererror.insert(episode: '045', link: 'http://traffic.libsyn.com/usererror/ue-045.mp3')
usererror.insert(episode: '046', link: 'http://traffic.libsyn.com/usererror/ue-046.mp3')
usererror.insert(episode: '047', link: 'http://traffic.libsyn.com/usererror/ue-047.mp3')
usererror.insert(episode: '048', link: 'http://traffic.libsyn.com/usererror/ue-048.mp3')
usererror.insert(episode: '049', link: 'http://traffic.libsyn.com/usererror/ue-049.mp3')
usererror.insert(episode: '050', link: 'http://traffic.libsyn.com/usererror/ue-050.mp3')

# Coder Radio Table
coderradio.insert(episode: '055', link: 'http://www.podtrac.com/pts/redirect.mp3/traffic.libsyn.com/jbmirror/cr-0055-mp3.mp3')
coderradio.insert(episode: '056', link: 'http://www.podtrac.com/pts/redirect.mp3/traffic.libsyn.com/jnite/cr-0056-mp3.mp3')
coderradio.insert(episode: '057', link: 'http://www.podtrac.com/pts/redirect.mp3/traffic.libsyn.com/jbmirror/cr-0057-mp3.mp3')
coderradio.insert(episode: '058', link: 'http://www.podtrac.com/pts/redirect.mp3/traffic.libsyn.com/jbmirror/cr-0058-mp3.mp3')
