# OKP4 snapshot (block 469687)

Automatic installation script

<code>
wget -O snapshot_okp4.sh https://raw.githubusercontent.com/mrraange/tools/main/snapshot_okp4.sh && chmod +x snapshot_okp4.sh && ./snapshot_okp4.sh
</code>
<hr>

Manual installation
<li>stop the service and reset the data
<code>
sudo systemctl stop okp4d
cp $HOME/.okp4d/data/priv_validator_state.json $HOME/.okp4d/priv_validator_state.json.backup
rm -rf $HOME/.okp4d/data</code>

<li>download snapshot, restart the service and check the log
<code>
curl -L https://rangenodes.com/snapshots/snapshot_latest.tar.lz4 | tar -Ilz4 -xf - -C $HOME/.okp4d
mv $HOME/.okp4d/priv_validator_state.json.backup $HOME/.okp4d/data/priv_validator_state.json
sudo systemctl restart okp4d && sudo journalctl -u okp4d -f --no-hostname -o cat
</code>
