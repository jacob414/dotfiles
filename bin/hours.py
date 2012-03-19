import sys
import datetime

times = open(sys.argv[1])

for line in times.readlines():
    if line.startswith('20'):
        isoday = line.strip()
        year, month, day = [int(part) for part in isoday.split('-')]
    if line.startswith('Kom') and 'gick' in line:
        line = line.strip()
        line = line.replace(',', '')
        # print('%s: %s' % (day, line.strip()))
        segs = line.split(' ')
        if len(segs) >= 4:
            # print('%s, kom %s gick %s' % (isoday, segs[1], segs[3]))
            try:
                arrive = segs[1].split('.')
                arrive = datetime.datetime(year, month, day,
                                           int(arrive[0]),
                                           int(arrive[1]))
            except Exception, e:
                print(e)
                sys.exit(1)
            try:
                left = segs[3].split('.')
                went = datetime.datetime(year, month, day,
                                         int(left[0]),
                                         int(left[1]))
            except Exception, e:
                print(e)
                sys.exit(1)
            worktime = went - arrive
            hrs, secs = divmod(worktime.seconds, 60*60)
            mins, secs = divmod(secs, 60)
            print('%s, %s, %s, %s' % (isoday, hrs, mins, worktime.seconds))
        else:
            pass
            # print('%s MISSED %s' % (isoday, line))

