import os, math, subprocess, io
import tkinter.messagebox
import tkinter
import ttkbootstrap as ttk
from pathlib import Path
import time

VERBOSE = False

if not tkinter.messagebox.askokcancel("Beta Version","This project is in devlopment not everything will work.\nDo you want to continue?"):
    exit()

print("Starting...")

if VERBOSE:
    print(f"ttkbootstrap import SUCCESSFUL - {time.time()}")
    tkinter.messagebox.showinfo("Development Warning","You are running this program in development mode which means that development features")

def _main(file):
    os.environ["__COMPAT_LAYER"] = "RunAsInvoker"
    subprocess.Popen(f"start {file}", shell=False)
    os.environ["__COMPAT_LAYER"] = ""

app = tkinter.Tk()
app.title("ReParse Development")
app.geometry("600x500")
mainframe = ttk.Frame()
mainframe.pack(fill='both')
app.mainloop()
