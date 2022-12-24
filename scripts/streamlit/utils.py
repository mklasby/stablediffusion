import streamlit as st
import pathlib


def save_image(image, idx, prompt, seed, out_path: pathlib.Path):
    out_path.mkdir(parents=True, exist_ok=True)
    st.info("Saving image...")
    clean_prompt = "_".join(prompt.replace(","," ").split(" "))
    f_name =f"{clean_prompt}_{seed}_{idx}.png"
    image.save(out_path / f_name, "PNG")
    st.success(f"Image saved to {out_path}")