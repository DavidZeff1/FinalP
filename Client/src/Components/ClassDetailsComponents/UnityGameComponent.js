import React, { useState } from "react";
import { Unity, useUnityContext } from "react-unity-webgl";
const base = "/UnityBuild/Build/UnityBuild";
export default function UnityGameComponent() {
  const [selectFile, setSelectFile] = useState(null);
  const { unityProvider } = useUnityContext({
    loaderUrl: base + ".loader.js",
    dataUrl: base + ".data",
    frameworkUrl: base + ".framework.js",
    codeUrl: base + ".wasm",
  });
  const fileChange = (event) => {
    setSelectFile(event.target.files[0]);
  };
  const gameFileSubmit = async (event) => {
    event.preventDefault();
    const data = new FormData();
    data.append("file", selectFile);

    const res = await fetch("http://localhost:5000/handleUnityGameFile", {
      method: "PUT",
      body: data,
    });
    console.log(res);
  };

  return (
    <>
      <div className="start-game-button">
        <form>
          <input type="file" onChange={fileChange} />
          <button onClick={gameFileSubmit}>Submit</button>
        </form>
      </div>
      <Unity
        unityProvider={unityProvider}
        style={{
          width: "100%",
          height: "100%",
        }}
      />
    </>
  );
}
