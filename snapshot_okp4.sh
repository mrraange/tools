sudo systemctl stop okp4d
cp $HOME/.okp4d/data/priv_validator_state.json $HOME/.okp4d/priv_validator_state.json.backup
rm -rf $HOME/.okp4d/data
cd $HOME/.okp4d
wget https://rangenodes.com/snapshots/snapshot_okp4.tar.gz
tar -xvf snapshot_okp4.tar.gz
mv $HOME/.okp4d/priv_validator_state.json.backup $HOME/.okp4d/data/priv_validator_state.json
sudo systemctl restart okp4d && journalctl -u okp4d -f --no-hostname -o cat
