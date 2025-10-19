import { useState, useEffect } from 'react';
import './BackendMessage.css';

export function BackendMessage() {
  const [message, setMessage] = useState('');

  useEffect(() => {
    fetch('/api/hello')
      .then(response => response.json())
      .then(data => setMessage(JSON.stringify(data)));
  }, []);

  return (
    <p>
      Message from backend: <span className="json-response">{message}</span>
    </p>
  );
}
