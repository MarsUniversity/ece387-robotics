



# Bluetooth BLE iBeacons

## References

- [bluepy - sort  of works](https://github.com/IanHarvey/bluepy)
- [linux-ibeacon](https://github.com/dburr/linux-ibeacon)
- [misc](https://pastebin.com/CggfqBy5)

# iBeacons

![](pics/format.png)

## Low Level Linux Commands

```bash
hciconfig hci0 up
hciconfig hci0 leadv 3
hciconfig noscan hci0
hcitool -i hci0 cmd 0x08 0x0008 1E 02 01 1A 1A FF 4C 00 02 15 uuid major minor power 00 >/dev/null
```

- leadv 3: advertise and not-connectable
- leadv 0: advertise and connectable

## `hciconfig`

```bash
pi@mario ~ $ hciconfig --help
hciconfig - HCI device configuration utility
Usage:
	hciconfig
	hciconfig [-a] hciX [command ...]
Commands:
	up                 	Open and initialize HCI device
	down               	Close HCI device
	reset              	Reset HCI device
	rstat              	Reset statistic counters
	auth               	Enable Authentication
	noauth             	Disable Authentication
	encrypt            	Enable Encryption
	noencrypt          	Disable Encryption
	piscan             	Enable Page and Inquiry scan
	noscan             	Disable scan
	iscan              	Enable Inquiry scan
	pscan              	Enable Page scan
	ptype      [type]  	Get/Set default packet type
	lm         [mode]  	Get/Set default link mode
	lp         [policy]	Get/Set default link policy
	name       [name]  	Get/Set local name
	class      [class] 	Get/Set class of device
	voice      [voice] 	Get/Set voice setting
	iac        [iac]   	Get/Set inquiry access code
	inqtpl     [level] 	Get/Set inquiry transmit power level
	inqmode    [mode]  	Get/Set inquiry mode
	inqdata    [data]  	Get/Set inquiry data
	inqtype    [type]  	Get/Set inquiry scan type
	inqparms   [win:int]	Get/Set inquiry scan window and interval
	pageparms  [win:int]	Get/Set page scan window and interval
	pageto     [to]    	Get/Set page timeout
	afhmode    [mode]  	Get/Set AFH mode
	sspmode    [mode]  	Get/Set Simple Pairing Mode
	aclmtu     <mtu:pkt>	Set ACL MTU and number of packets
	scomtu     <mtu:pkt>	Set SCO MTU and number of packets
	delkey     <bdaddr>	Delete link key from the device
	oobdata            	Get local OOB data
	commands           	Display supported commands
	features           	Display device features
	version            	Display version information
	revision           	Display revision information
	block      <bdaddr>	Add a device to the blacklist
	unblock    <bdaddr>	Remove a device from the blacklist
	lerandaddr <bdaddr>	Set LE Random Address
	leadv      [type]  	Enable LE advertising
			0 - Connectable undirected advertising (default)
			3 - Non connectable undirected advertising
	noleadv            	Disable LE advertising
	lestates           	Display the supported LE states
```

### `hcitool`

Here I used the LightBlue Explorer to simulate a proximity device

```bash
pi@mario ~ $ sudo hcitool lescan
LE Scan ...
E4:F0:42:26:41:54 (unknown)
45:A0:D0:C8:2C:C5 Proximity
45:A0:D0:C8:2C:C5 (unknown)
69:3D:8A:0C:49:C7 (unknown)
69:3D:8A:0C:49:C7 (unknown)
E4:F0:42:26:41:54 (unknown)
00:22:AE:05:42:31 (unknown)
EE:2C:B3:27:93:1D (unknown)
```

### Power

```python
def set_power(power):
  """
  Given a p (power) in negative dB, return let power byte
  """
  return 256 - power
```

### Distance

```python
def distance(RSSI, txpwr):
  """
  RSSI is what the receiver measured
  txpwr is last byte in LE message
  """
  n = 2  # valid for free space
  return 10**((txpwr - RSSI)/(10*n))
```
