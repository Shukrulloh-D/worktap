import { useState } from 'react';
const CHATS = Array(6).fill(null).map((_, i) => ({ id: i + 1, name: 'Никита Евреев', avatar: 'https://i.pravatar.cc/60?img=12', lastMsg: 'Ну че там, сделал?', online: i === 0 }));
export const ChatPage = () => {
  const [active, setActive] = useState(1);
  const [msg, setMsg] = useState('');
  const [messages, setMessages] = useState([
    { id: 1, from: 'them', text: 'Нужно сделать супер крутой дизайн для сайта' },
    { id: 2, from: 'them', text: 'Ну я общем так' },
    { id: 3, from: 'me', text: 'Ок!' },
  ]);
  const send = (e) => {
    e.preventDefault();
    if (!msg.trim()) return;
    setMessages([...messages, { id: Date.now(), from: 'me', text: msg }]);
    setMsg('');
  };
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '30px 0' }}>
        <div className="container">
          <div style={{ display: 'grid', gridTemplateColumns: '320px 1fr', background: 'white', borderRadius: 16, overflow: 'hidden', boxShadow: '0 4px 20px rgba(0,0,0,0.03)', minHeight: 600 }}>
            <div style={{ borderRight: '1px solid #F0F0F0' }}>
              <div style={{ padding: 20 }}><input className="input" placeholder="Поиск" /></div>
              {CHATS.map(c => (
                <div key={c.id} onClick={() => setActive(c.id)} style={{ padding: 16, display: 'flex', gap: 12, cursor: 'pointer', background: active === c.id ? '#E8F7EC' : 'transparent', alignItems: 'center' }}>
                  <div style={{ position: 'relative' }}>
                    <img src={c.avatar} alt="" style={{ width: 44, height: 44, borderRadius: '50%' }} />
                    {c.online && <div style={{ position: 'absolute', bottom: 0, right: 0, width: 12, height: 12, borderRadius: '50%', background: '#21B349', border: '2px solid white' }} />}
                  </div>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ fontWeight: 700, fontSize: 14 }}>{c.name}</div>
                    <div style={{ fontSize: 12, color: '#8B8B8B', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{c.lastMsg}</div>
                  </div>
                </div>
              ))}
            </div>
            <div style={{ display: 'flex', flexDirection: 'column' }}>
              <div style={{ padding: 16, borderBottom: '1px solid #F0F0F0', display: 'flex', gap: 12, alignItems: 'center' }}>
                <img src="https://i.pravatar.cc/60?img=12" alt="" style={{ width: 40, height: 40, borderRadius: '50%' }} />
                <div>
                  <div style={{ fontWeight: 700, fontSize: 14 }}>Никита Евреев</div>
                  <div style={{ fontSize: 12, color: '#21B349' }}>Онлайн</div>
                </div>
              </div>
              <div style={{ flex: 1, padding: 20, overflowY: 'auto', display: 'flex', flexDirection: 'column', gap: 12 }}>
                {messages.map(m => (
                  <div key={m.id} style={{ display: 'flex', justifyContent: m.from === 'me' ? 'flex-end' : 'flex-start' }}>
                    <div style={{ maxWidth: '60%', padding: '12px 16px', borderRadius: 16, background: m.from === 'me' ? '#E8F7EC' : '#FFE4CC', fontSize: 14 }}>{m.text}</div>
                  </div>
                ))}
              </div>
              <form onSubmit={send} style={{ padding: 16, borderTop: '1px solid #F0F0F0', display: 'flex', gap: 12 }}>
                <input className="input" placeholder="Введите сообщение" value={msg} onChange={(e) => setMsg(e.target.value)} />
                <button type="submit" className="btn btn-primary">Отправить</button>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};
