# chapter 8

## Setup

Before running `main.py` make sure that you setup your environment:

### Mac and Linux

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Windows (Powershell)

```pwsh
python -m venv venv
venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

## Cleanup

After running `main.py`, you can cleanup the environment like so:

### Mac and Linux

```bash
rm -f addressbook.db
deactivate
```

### Windows (Powershell)

```pwsh
Remove-Item addressbook.db
deactivate
```