# Disk benchmarking

## setup fio on MacOS

```shell
brew install fio
cd ~/path/to
fio --name=benchmark --rw=randrw --bs=4k --size=1G --numjobs=1 --runtime=60s --group_reporting
```

* --name=benchmark → Sets the test name.
* --rw=randrw → Performs random read/write operations.
* --bs=4k → Uses 4KB block size, common for SSDs.
* --size=1G → Runs the test on a 1GB file.
* --numjobs=1 → Uses a single job (single thread).
* --runtime=60s → Runs for 60 seconds.
* --group_reporting → Displays results in a summarized format.

## Check Benchmark Results

```shell sample result
READ: IOPS=2345, BW=9.15MiB/s  
WRITE: IOPS=2100, BW=8.42MiB/s
```

* IOPS (Input/Output Operations Per Second) – Higher is better.
* BW (Bandwidth) – Shows speed in MiB/s (1 MiB ≈ 1.05 MB).

## Run Sequential Read/Write Test

```shell
fio --name=seq_read --rw=read --bs=1M --size=1G --numjobs=1 --runtime=60s --group_reporting
fio --name=seq_write --rw=write --bs=1M --size=1G --numjobs=1 --runtime=60s --group_reporting
```

* --rw=read → Tests sequential read performance.
* --rw=write → Tests sequential write performance.
* --bs=1M → Uses 1MB block size for large file transfers.

## Alternative: KDiskMark (GUI-Based)

* KDiskMark
** dependency xquartz

```shell
brew install --cask xquartz
```
