import { useState, useEffect } from 'react';
import './BackendMessage.css';

export function BackendMessage() {
  const [message, setMessage] = useState('');

  useEffect(() => {
    fetch('/api/hello')
      .then(response => response.json())
      .then(data => setMessage(data.Hello));
  }, []);

  return (
    <p>
      Message from backend: {message}
    </p>
  );
}
