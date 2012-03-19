import sys
import datetime

times = open(sys.argv[1])

def dot_times(dotted):
    try:
        hrs, mins = dotted.split('.')
        return int(hrs), int(mins)
    except Exception, e:
        print(e)
        sys.exit(1)

for line in (l.strip() for l in times.readlines()):
    if line.startswith('20'):
        isoday = line
        year, month, day = [int(part) for part in isoday.split('-')]
    if line.startswith('Kom') and 'gick' in line:
        line = line.strip()
        line = line.replace(',', '')
        segs = line.split(' ')
        if len(segs) >= 4:
            arrive = datetime.datetime(year, month, day, *dot_times(segs[1]) )
            went = datetime.datetime(year, month, day, *dot_times(segs[3]))
            worktime = went - arrive
            hrs, secs = divmod(worktime.seconds, 60*60)
            mins, secs = divmod(secs, 60)
            print('%s, %s, %s, %s' % (isoday, hrs, mins, worktime.seconds))
